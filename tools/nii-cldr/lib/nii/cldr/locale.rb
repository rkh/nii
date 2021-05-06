# frozen_string_literal: true
module Nii::CLDR
  class Locale
    BUNDLES = {
      locale_names: ['cldr-localenames-full', 'main', 'localeDisplayNames'],
      misc:         ['cldr-misc-full',        'main'],
      dates:        ['cldr-dates-full',       'main', 'dates'],
      numbers:      ['cldr-numbers-full',     'main', 'numbers'],
      units:        ['cldr-units-full',       'main', 'units'],
    }

    MAIN_CALENDARS  = ['generic', 'gregorian']
    PARENT_OVERRIDE = {}

    attr_reader :repository, :code, :fetch_code

    def initialize(repository, code, relevant:, default:)
      @fetch_code, @code               = code, Nii::Locale.parse(code).code
      @repository, @relevant, @default = repository, relevant, default
    end

    def relevant?
      @relevant or root?
    end

    def default?
      @default
    end

    def load
      locale_info[:source]           = relevant? ? { gem: 'nii-core' } : { gem: 'nii-extra-locales', require: 'nii/extra_locales' }
      locale_info[:source][:path]    = directory
      language_info[:default_locale] = code if default?
      self.parent                    = supplemental(:parentLocales, :parentLocale) || PARENT_OVERRIDE[code]
    end

    def generate
      store(:core, :info, parent_locale: parent.code) unless root?
      supplemental(:plurals)  { |data| plurals[:cardinal] = data.transform_keys { |k| k.sub('pluralRule-count-', '') }}
      supplemental(:ordinals) { |data| plurals[:ordinal]  = data.transform_keys { |k| k.sub('pluralRule-count-', '') }}

      language_info = store(:core, :info)[:language_data] ||= {}
      supplemental(:languageData) do |data|
        data.each do |key, value|
          info = language_info[key.sub('_', '')] ||= {}
          info[:primary] = value
        end
      end

      supplemental(:languageData, suffix: '-alt-secondary') do |data|
        data.each do |key, value|
          info = language_info[key.sub('_', '')] ||= {}
          info[:secondary] = value
        end
      end

      supplemental(:pluralRanges) do |data|
        data = data.transform_keys do |key|
          raise "malformatted key: #{key}" unless key =~ /^pluralRange-start-(.+)-end-(.+)$/
          "#$1-#$2"
        end
        plurals[:ranges] = data
      end
      
      supplemental(:grammaticalGenderFeatures, suffix: '-targets-nominal') do |data|
        grammar               = store(:core, :info)[:grammar] ||= {}
        gender_info           = grammar[:genders]             ||= {}
        gender_info[:nominal] = data.fetch('grammaticalGender') { raise [data, fetch_code].inspect }
        gender_info[:units]   = data['grammaticalGender-scope-units'] if data.include? 'grammaticalGender-scope-units'
      end

      supplemental(:gender, :personList) do |data|
        grammar = store(:core, :info)[:grammar] ||= { genders: {} }
        grammar[:genders][:person_list] = data
      end
      
      supplemental(:grammaticalFeatures, suffix: '-targets-nominal') do |data|
        grammar = store(:core, :info)[:grammar] ||= {}

        if cases = data['grammaticalCase']
          grammar[:cases]         ||= {}
          grammar[:cases][:default] = cases
        end

        if cases = data['grammaticalCase-scope-units']
          grammar[:cases]       ||= {}
          grammar[:cases][:units] = cases
        end

        if definiteness = data['grammaticalDefiniteness']
          grammar[:definiteness] = definiteness
        end
      end

      supplemental(:grammaticalFeatures) do |data|
        grammar = store(:core, :info)[:grammar] ||= {}
        data.each do |key, value|
          raise key.inspect unless key =~ /^([^\-]+)\-feature\-(.+)\-([^\-]+)$/
          base      = $1
          feature   = $2
          key       = $3
          value     = value.transform_keys { |k| k.sub(/^_/, '') } if value.is_a? Hash
          info      = grammar[underscore(base)]  ||= {}
          info      = info[feature.tr('-', '_')] ||= {}
          info[key] = value
        end
      end

      supplemental(:dayPeriods, namespace: 'dayPeriodRuleSet') do |data|
        store(:core, :info)[:day_periods] = { default: data.transform_values { |v| v.transform_keys { |k| k.sub(/^_/, '') } } }
      end

      supplemental(:dayPeriods, namespace: 'dayPeriodRuleSet-type-selection') do |data|
        store(:core, :info)[:day_periods][:selection] = data.transform_values { |v| v.transform_keys { |k| k.sub(/^_/, '') } }
      end

      %i[territories scripts variants languages].each do |category|
        bundle(:locale_names, category) do |data|
          entries = {}
          data.each do |key, value|
            key      = key.downcase if category == :variants
            alt      = 'default'
            key, alt = $1, $2 if key =~ /^(.+)-alt-(.+)$/
            entries[key] ||= {}
            entries[key][alt] = value
          end
          store(:core, :names, category => entries)
        end
      end

      %i[keys types].each do |category|
        bundle(:locale_names, category) do |data|
          store(:core, :names, category => parse_field_hash(data))
        end
      end

      bundle(:locale_names, :localeDisplayPattern) do |data|
        store(:core, :names, display_pattern: {
          pattern:          data.fetch('localePattern'),
          separator:        data.fetch('localeSeparator'),
          key_type_pattern: data.fetch('localeKeyTypePattern')
        })
      end

      bundle(:locale_names, :codePatterns) do |data|
        store(:core, :names, code_patterns: data)
      end

      bundle(:misc, :delimiters) do |data|
        store(:core, :info, delimiters: data.transform_keys { |k| underscore(k) })
      end

      bundle(:misc, :layout) do |data|
        store(:core, :info, layout: parse_field_hash(data))
      end

      bundle(:misc, :listPatterns) do |data|
        store(:core, :info, list_patterns: data.transform_keys { |k| k[/^listPattern-type-(.+)$/, 1] })
      end

      bundle(:dates, :dateFields, :fields) do |data|
        data.each do |key, value|
          field, type  = key.split('-')
          field        = underscore(field)
          field        = 'day_period' if field == 'dayperiod'
          type       ||= 'long'
          stored       = store(:core, :info)[:dates] ||= {}
          stored       = stored[field] ||= {}
          stored[type] = parse_field_hash(value, flatten: ['relative_time_pattern'])
        end
      end

      bundle(:dates, :timeZoneNames) do |data|
        info = store(:core, :info)
        info = info[:time_zones] ||= {}
        info.merge! zones: parse_zone_hash(data['zone']), meta_zones: parse_zone_hash(data['metazone'])
        info.merge! parse_field_hash(data.except('zone', 'metazone'))
      end

      bundle(:numbers) do |data|
        store(:core, :info, numbers: parse_field_hash(data))
        systems  = data['defaultNumberingSystem']
        systems  = systems.values if systems.is_a? Hash
        systems  = Array(systems)
        systems += Array(data['otherNumberingSystems']&.values)
        systems.each { |system| Repository::DEFAULT_LOCALES[system] ||= code }
      end

      bundle(:numbers, :currencies) do |data|
        store(:core, :names, currencies: data.transform_values { |d| parse_field_hash(d) })
      end

      bundle(:units) do |data|
        info = store(:core, :units, units: {})
        parse_field_hash(data).each do |type, map|
          case type
          when 'duration_unit'
            info[:duration] = map
          when 'long', 'short', 'narrow'
            map.each do |key, value|
              case key
              when /^\d+p\-?\d+$/, 'per', 'power2', 'power3', 'times'
                info[:patterns]          ||= {}
                info[:patterns][key]     ||= {}
                info[:patterns][key][type] = value
              when 'coordinate_unit'
                info[:coordinates] ||= {}
                value.each do |direction, unit|
                  info[:coordinates][type] ||= {}
                  info[:coordinates][type][direction] = unit
                end
              when /^([a-z]+)\-(.+)$/
                info[:units][$2]     ||= { quantity: $1 }
                info[:units][$2][type] = value
                raise "mismatch: #$1 vs #{info[:units][$2][:quantity]}" if info[:units][$2][:quantity] != $1
              else
                raise "unexpected key: #{key}"
              end
            end
          else
            raise "unexpected type: #{key}"
          end
        end
      end

      rbnf do |data|
        data.each do |group, rules|
          content = rules.map { |name, lines| "#{name}:\n#{lines.map { |l| l.join(': ') }.join("\n")}\n" }.join("\n")
          store(:core, :rbnf, underscore(group) => content)
        end
      end

      calendars do |name, data|
        container       = MAIN_CALENDARS.include?(name) ? store(:core, :info) : store(:calendars, :calendars)
        container       = container[:calendars] ||= {}
        container[name] = parse_field_hash(data)
      end
    end

    def calendars
      repository.root.glob("*-full/main/#{fetch_code}/ca-*.json") do |path|
        name    = path.basename.to_s[/^ca-(.+)\.json$/, 1]
        content = JSON.load(path.read).dig('main', fetch_code, 'dates', 'calendars', name)
        raise "expected #{path} to include #{name}" unless content
        yield(name, content)
      end
    end

    def parse_zone_hash(hash)
      return hash unless hash.is_a? Hash
      return parse_field_hash(hash) if hash.include? 'exemplarCity'
      hash.transform_keys { |k| k.tr('_', ' ') }.transform_values { |h| parse_zone_hash(h) }
    end

    def parse_field_hash(input, flatten: [])
      return input unless input.is_a? Hash
      input.inject({}) do |output, (key, value)|
        key, subkey = key.split(/-type-|-count-|-alt-|-numberSystem-/) if key.include? '-'
        key    = underscore(key)
        value  = parse_field_hash(value, flatten: flatten)
        if subkey
          if flatten.include? key
            output[subkey] = value
          else
            case previous = output[key]
            when nil  then output[key] = { subkey => value }
            when Hash then output[key] = previous.merge(subkey => value)
            else output[key] = { 'default' => previous, subkey => value }
            end
          end
        else
          output[key] = value
        end
        output
      end
    end

    def bundle(name, entry = nil, key = entry)
      path, container, namespace = BUNDLES.fetch(name)
      return unless path = repository.root.join(path, container, fetch_code) and path.exist?
      path = path.join("#{entry}.json").exist? ? path.join("#{entry}.json") : path.join("#{namespace || entry}.json")
      data = JSON.load(path.read).fetch(container).fetch(fetch_code)
      data = data.fetch(namespace) if namespace
      data = data.fetch(key.to_s) if key
      yield data if block_given?
      data
    end

    def rbnf
      path = repository.root.join('cldr-rbnf', 'rbnf', "#{fetch_code}.json")
      data = JSON.load(path.read).fetch('rbnf').fetch('rbnf') if path.exist?
      yield data if data
    end

    def parent
      @parent ||= case code
      when 'root'           then nil
      when /^(.+)\-[^\-]+$/ then repository.locale($1)
      else repository.locale('root')
      end
    end

    def parent=(value)
      value   = repository.locale(value) unless value.nil? or value.is_a? Locale
      @parent = value
    end

    def plurals
      store(:core, :info)[:plurals] ||= {}
    end

    def supplemental(key, *subkeys, suffix: nil, namespace: key)
      supplemental = repository.supplemental(key, namespace: namespace)
      supplemental = supplemental.fetch(subkeys.shift.to_s) while subkeys.any?
      supplemental = supplemental.fetch("#{fetch_code}#{suffix}") { supplemental.fetch(fetch_code) { return }}
      yield supplemental if block_given?
      supplemental
    end

    def store(group, name, data = {})
      group = :extra unless relevant?
      store = repository.store(group, directory, name, data)
      store.optional_data[:@locale] = code
      store
    end

    def locale_info
      return language_info unless variant?
      language_info[:locales]       ||= {}
      language_info[:locales][code] ||= {}
    end

    def language_info
      repository.locale_info[language_code] ||= {}
    end

    def language_code
      code[/^[^\-]+/]
    end

    def variant?
      code.include? '-'
    end

    def root?
      code == 'root' or code == 'und'
    end

    def directory
      return '.' if root?
      @directory ||= ['.', *code_list].join('/')
    end

    def code_list
      @code_list ||= code.split('-').inject([]) { |l, e| [*l, [l.last, e].compact.join('-')] }
    end

    def underscore(key)
      repository.underscore(key)
    end
  end
end
