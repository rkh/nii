# frozen_string_literal: true

module Nii::Parser
  class Locale
    # Private extensions Nii supports (values are attributes passed via -x-).
    X_FIELDS = {
      formality: %w[ formal informal avoid ]
    }
    
    # Unicode locale field mapping of -u- codes. Only the ones relevant for Nii are listed.
    U_FIELDS = {
      calendar_algorithm:        'ca', currency_format:   'cf', collation:   'co', currency:           'cu',
      emoji_representation:      'em', first_day_of_week: 'fw', hour_cycle:  'hc', measurement_system: 'ms',
      numbering_system:          'nu', region_override:   'rg', subdivision: 'sd', timezone:           'tz',
      measurement_unit_override: 'mu'
    }

    # Conversion of Unicode locale parameters to LDML names
    U_SERIALIZE = {
      measurement_system: { 'US' => 'ussystem', 'UK' => 'uksystem' },
      measurement_unit_override: { 'fahrenheit' => 'fahrenhe' },
    }

    U_TAGS          = U_FIELDS.invert
    X_TAGS          = X_FIELDS.flat_map { |k,v| v.map { |i| [i, k] } }.to_h
    U_DESERIALIZE   = U_SERIALIZE.transform_values(&:invert)
    SEPERATOR       = /[\-_]/
    SUBTAG_LANGUAGE = /^(?:[A-Za-z]{2,3}|[A-Za-z]{5,8})$/
    SUBTAG_SCRIPT   = /^[A-Za-z]{4}$/
    SUBTAG_REGION   = /^(?:[0-9A-Za-z]{2}|\d{3})$/
    SUBTAG_VARIANT  = /^(?:[0-9A-Za-z]{5,8}|\d[0-9A-Za-z]{3})$/
    IGNORE          = /[\.:@].*$/
    CACHE           = {}

    # the only ms alias
    U_DESERIALIZE[:measurement_system]['imperial'] = 'UK'

    include Nii::Errors
    attr_reader :input

    def self.parse(input, complain: false)
      return input if input.is_a? Nii::Locale
      # this intentionally doesn't write anything to the cache
      # the input could be any arbitrary string and fill up memory
      CACHE.fetch(input) { new(input).parse(complain) }
    end

    # fills the parse cache for the given locales
    def self.cache(*locales)
      while locale = locales.shift
        CACHE[locale] ||= begin
          result = parse(locale)
          locales.concat result[1][:lookup][1..-1]
          Nii::Utils.deep_freeze(result)
        end
      end
    end

    def self.generate_code(language: 'und', region: nil, script: nil, variants: [], formality: nil, **options)
      tags     = [ language, script, region, *variants ]
      u_fields = U_FIELDS.map { |f,t| "#{t}-#{serialize(f, options[f])}" if options[f] }.compact
      tags.concat(['u'], u_fields) if u_fields.any?
      tags << 'x' << formality     if formality
      tags.compact.join('-')
    end

    def self.serialize(key, value)
      if key == :region_override or key == :subdivision
        value = Nii::Utils.string(value).downcase
        value.size == 2 ? "#{value}zzzz" : value
      else
        U_SERIALIZE.dig(key, value) || Nii::Utils.string(value).downcase
      end
    end
    
    def initialize(input)
      @input = Nii::Utils.string(input).sub(IGNORE, '')
    end

    def parse(complain)
      parse!
    rescue ParseError => error
      raise error if complain
      ['und', lookup: ['und', 'root'], language: 'und']
    end

    private

    def parse!
      reset
      parse_language_identifier
      parse_extensions
      normalize
      lookup
      [ Locale.generate_code(**@options), @options ]
    end

    def lookup
      @options[:lookup] ||= [
        *variant_tags(:language, :script, :region),
        tag(:language, :script, :region),
        *variant_tags(:language, :region),
        tag(:language, :region),
        *variant_tags(:language, :script),
        tag(:language, :script),
        *variant_tags(:language),
        tag(:language),
        tag('und', :script),
        tag('und'),
        tag('root')
      ].compact.uniq
    end

    def variant_tags(*keys)
      return unless tag = tag(*keys)
      variants = @options[:formality] ? [*@options[:variants], "x-#{@options[:formality]}"] : @options[:variants]
      variants.size.downto(1).flat_map { |count| variants.combination(count).map { |v| [tag, *v].join('-') }} if variants and variants.any?
    end

    def tag(*keys)
      values = keys.map { |k| Symbol === k ? @options[k] : k }
      values.flatten.join('-') unless values.include? nil
    end

    def reset
      @lookup  = nil
      @tokens  = input.split(/[\-_]/)
      @options = { language: String.new('und') }
    end

    def normalize
      @options.delete_if { |k, v| v.nil? or v == [] }
      @options[ :language ]&.downcase!
      @options[ :script   ]&.capitalize!
      @options[ :region   ]&.upcase!
      @options[ :variants ]&.each(&:downcase!)
      @options[ :variants ]&.sort!
      @options[ :variants ]&.uniq!

      if subdivision = @options[:subdivision]&.downcase
        if region = @options[:region]
          @options.delete(:subdivision) unless subdivision.start_with? region.downcase
        else
          @options[:region]      = subdivision[0,2].upcase
          @options[:subdivision] = subdivision
        end
        @options.delete(:subdivision) if subdivision.end_with? 'zzzz'
      end

      if region_override = @options[:region_override]&.downcase
        if region_override.end_with? 'zzzz' or region_override.size == 2
          @options[:region_override] = region_override[0,2].upcase
        end
        @options.delete(:region_override) if @options[:region_override] == @options[:region]
      end
    end

    def scan(pattern)
      @tokens.shift if pattern === @tokens.first
    end

    def scan_all(pattern)
      result = @tokens.take_while { |e| pattern === e }
      @tokens.shift(result.size)
    end

    def parse_language_identifier
      case tag = @tokens.shift
      when 'root'
      when SUBTAG_LANGUAGE then @options[:language], @options[:script] = tag, scan(SUBTAG_SCRIPT)
      when SUBTAG_SCRIPT   then @options[:script] = tag
      end

      @options[:region]   = scan(SUBTAG_REGION)
      @options[:variants] = scan_all(SUBTAG_VARIANT)
    end

    def parse_extensions
      extensions     = {}
      last_extension = nil

      while tag = @tokens.shift&.downcase
        if tag.size == 1 and not extensions.include? 'x'
          last_extension = extensions[tag.downcase] = []
        elsif last_extension
          last_extension << tag
        else
          raise ParseError, "unexpected subtag parsing #{@input.inspect}: #{tag.inspect}"
        end
      end

      parse_unicode_extensions(*extensions['u'])
      parse_private_extensions(*extensions['x'])
    end

    def parse_unicode_extensions(key = nil, *extensions)
      if key and field = U_TAGS[key]
        @options[field] = extensions.take_while { |e| e.size > 2 }.map { |e| U_DESERIALIZE.dig(field, e) || e }
        extensions.shift(@options[field].size)
        @options[field] = @options[field].any? ? @options[field].join('-') : nil
      end
      parse_unicode_extensions(*extensions) if extensions.any?
    end

    def parse_private_extensions(*extensions)
      extensions.each do |tag|
        next unless key = X_TAGS[tag]
        @options[key] = tag
      end
    end
  end
end
