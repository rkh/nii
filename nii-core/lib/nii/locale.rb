# frozen_string_literal: true

module Nii
  # IETF/Unicode Language Tag parser and generator.
  #
  # This class will automatically turn a valid language tag into its wellformed, canonical version. It does not however do any validation.
  # It will also drop any extensions it does not interpret (notably any transformed extension, as well as the unicode extensions dx lb, lw, ss, and va).
  # If you need data validation and/or populated default fields, you can use {Nii::Context}.
  #
  # Any suffix starting with a dot, colon, or at sign is ignored.
  # It should therefore be possible to parse environment variables like LANG or LC_CTYPE directly.
  #
  # @example Parsing a locale ID
  #   locale = Nii::Locale.new('en')
  #   locale.language  # => 'en'
  #
  #   locale = Nii::Locale.new('de-Latn-DE-1996-x-formal')
  #   locale.language  # => 'de'
  #   locale.script    # => 'Latn'
  #   locale.region    # => 'DE'
  #   locale.variants  # => ['1996']
  #   locale.formality # => 'formal'
  #
  # @example Normalizing a locale ID
  #   lang = ENV.fetch('LANG', 'en_US.UTF-8')
  #   Nii::Locale.new(lang).code
  #   # => 'en-US'
  #
  #   Nii::Locale.new('EN_us_U-MS-IMPERIAL-sd-gbsct').code
  #   # => 'en-US-u-ms-uksystem'
  #
  # @example Generating a locale ID
  #   Nii::Locale.new(language: 'en', region: 'us').code # => 'en-US'
  #   Nii::Locale.new('de-DE', script: 'Latn').code      # => 'de-Latn-DE'
  #
  #   # Swiss German, using US customary units and a buddhist calendar
  #   locale                    = Nii::Locale.new
  #   locale.language           = 'gsw'
  #   locale.calendar           = 'buddhist'
  #   locale.measurement_system = 'US'
  #   locale.code             # => 'gsw-u-ca-buddhist-ms-ussystem'
  #
  # @example Logical operations
  #   Nii::Locale.new('de').superset_of? Nii::Locale.new('de-AT')
  #   # => true
  #
  #   Nii::Locale.new('de').subset_of? Nii::Locale.new('de-AT')
  #   # => false
  #
  #   Nii::Locale.new(region: 'AT').superset_of? Nii::Locale.new('de-AT')
  #   # => true
  #
  #   Nii::Locale.new('de') & Nii::Locale.new(region: 'AT')
  #   # => Nii::Locale["de-AT"]
  #
  #   Nii::Locale.new('de-DE') & Nii::Locale.new(script: 'Latn')
  #   # => Nii::Locale["de-Latn-DE"]
  #
  #   Nii::Locale.new('de') | Nii::Locale.new('de-AT')
  #   # => Nii::Locale["de"]
  #
  #   Nii::Locale.new('de') & Nii::Locale.new('en-US')
  #   # => #<Nii::LocalePreference:[]>
  #
  #   Nii::Locale.new('de') | Nii::Locale.new('en-US')
  #   # => #<Nii::LocalePreference:[Nii::Locale["de"], Nii::Locale["en-US"]]>
  #
  #   (Nii::Locale.new('de') | Nii::Locale.new('en-US')) & Nii::Locale.new(region: 'US')
  #   # => #<Nii::LocalePreference:[Nii::Locale["de-US"], Nii::Locale["en-US"]]>
  #
  #   (Nii::Locale.new('de') | Nii::Locale.new('en-US')) & Nii::Locale.new(region: 'DE')
  #   # => #<Nii::LocalePreference:[Nii::Locale["de-DE"]]>
  #
  # @see https://tools.ietf.org/html/bcp47 [BCP 47] IETF Best Current Practice #47: Tags for Identifying Languages
  # @see http://www.unicode.org/reports/tr35/#Identifiers [UTS 35] Unicode Technical Standard #35: UNICODE LOCALE DATA MARKUP LANGUAGE (LDML)
  class Locale
    include Helpers::Territories, Helpers::Languages

    # @!attribute [rw] language
    #   Code identifying the language. Consist of a two to eight lower case letters. The only four letter value permitted is "root".
    #
    #   @example Read Access
    #     Nii::Locale.new('de-AT').language  # => 'de'
    #     Nii::Locale.new('de').language     # => 'de'
    #     Nii::Locale.new('und-DE').language # => nil
    #
    #   @example Write Access
    #     locale = Nii::Locale.new(region: 'AT')
    #     locale.language = 'de'
    #     locale.code # => 'de-AT'
    #
    #   @return [String, nil]
    
    # @!attribute [rw] region
    #   Code identifying the territory. Consists of either two upper case letters or three digits.
    #
    #   @example Read Access
    #     Nii::Locale.new('de-DE').region # => 'DE'
    #     Nii::Locale.new('de').region    # => nil
    #
    #   @example Write Access
    #     locale = Nii::Locale.new('en')
    #     locale.region = 'DE'
    #     locale.code # => 'en-DE'
    #
    #   @return [String, nil]
    #
    #   @note BCP calls this region, while Unicode uses both territory and region interchangable when talking about tags,
    #     and predominantly calls it territory in other parts of LDML.
    #
    # @!parse alias territory region
    # @!parse alias territory= region=
    
    # @!attribute [rw] script
    #  Four letter, capitalized code identifying the script
    #
    #  @example Read Access
    #    Nii::Locale.new('de-Latn').script # => 'Latn'
    #    Nii::Locale.new('de-DE').script   # => nil
    #
    #  @example Write Access
    #    locale = Nii::Locale.new('en-US')
    #    locale.script = 'Latn'
    #    locale.code # => 'en-Latn-US'
    #
    #  @return [String, nil]

    # @!attribute [rw] variants
    #   List of language variants. Variants are either 5 to 8 letters or digits, or one digit followed by three letters or digits.
    #
    #   @example
    #     Nii::Locale.new('zh-Latn-TW-pinyin').variants # => ['pinyin']
    #
    #   @return [Array<String>]

    # @!attribute [rw] calendar_algorithm
    #   @return [String, nil]
    #
    # @!parse alias calendar calendar_algorithm
    # @!parse alias calendar= calendar_algorithm=
    # @!parse alias ca calendar_algorithm
    # @!parse alias ca= calendar_algorithm=

    # @!attribute [rw] currency_format
    #   @return [String, nil]
    #
    # @!parse alias cf currency_format
    # @!parse alias cf= currency_format=

    # @!attribute [rw] collation
    #   @return [String, nil]
    #
    # @!parse alias co collation
    # @!parse alias co= collation=

    # @!attribute [rw] currency
    #   @return [String, nil]
    #
    # @!parse alias cu currency
    # @!parse alias cu= currency=

    # @!attribute [rw] emoji_representation
    #   @return [String, nil]
    #
    # @!parse alias em emoji_representation
    # @!parse alias em= emoji_representation=

    # @!attribute [rw] first_day_of_week
    #   @return [String, nil]
    #
    # @!parse alias fw first_day_of_week
    # @!parse alias fw= first_day_of_week=

    # @!attribute [rw] hour_cycle
    #   @return [String, nil]
    #
    # @!parse alias hc hour_cycle
    # @!parse alias hc= hour_cycle=

    # @!attribute [rw] measurement_system
    #   @return [String, nil]
    #
    # @!parse alias ms measurement_system
    # @!parse alias ms= measurement_system=

    # @!attribute [rw] numbering_system
    #   @return [String, nil]
    #
    # @!parse alias nu numbering_system
    # @!parse alias nu= numbering_system=

    # @!attribute [rw] region_override
    #   @return [String, nil]
    #
    # @!parse alias rg region_override
    # @!parse alias rg= region_override=

    # @!attribute [rw] subdivision
    #   @return [String, nil]
    #
    # @!parse alias sd subdivision
    # @!parse alias sd= subdivision=

    # @!attribute [rw] timezone
    #   @return [String, nil]
    #
    # @!parse alias tz timezone
    # @!parse alias tz= timezone=

    # @!attribute [rw] formality
    #   @return [String, nil]

    CACHE          = Cache.new
    KEY_ALIASES    = { territory: :region, calendar: :calendar_algorithm }
    AVAILABLE_KEYS = [
      :language, :script, :region, :variants,
      *Nii::Parser::Locale::U_FIELDS.keys,
      *Nii::Parser::Locale::X_FIELDS.keys
    ]
    KEY_ALIASES.merge! Nii::Parser::Locale::U_TAGS.transform_keys(&:to_sym)
    ALL_KEYS = AVAILABLE_KEYS + KEY_ALIASES.keys
    private_constant :AVAILABLE_KEYS, :KEY_ALIASES, :ALL_KEYS, :CACHE

    # @example With options
    #   Nii::Locale.new(language: 'en', region: 'US') # => Nii::Locale["en-US"]
    #
    # @example With code
    #    Nii::Locale.new('en-US') # => Nii::Locale["en-US"]
    #
    # @example With code and options
    #    Nii::Locale.new('en', region: 'US') # => Nii::Locale["en-US"]
    #
    # @param code [String, Symbol, Nii::Locale, nil]
    # @param complain [true, false] whether or not to raise an exception if the code is invalid
    # @option options [String, Symbol, #to_s] language two to eight letter language code
    # @option options [String, Symbol, #to_s, #to_nii_territory] region two letter or three digit region code
    # @option options [String, Symbol, #to_s] script four letter script code
    # @option options [Array<String, Symbol, #to_s>] variants array of variant codes
    # @option options [String, Symbol, #to_s] calendar_algorithm ca unicode extension code
    # @option options [String, Symbol, #to_s] currency_format cf unicode extension code
    # @option options [String, Symbol, #to_s] collation co unicode extension code
    # @option options [String, Symbol, #to_s] currency cu unicode extension code
    # @option options [String, Symbol, #to_s] emoji_representation em unicode extension code
    # @option options [String, Symbol, #to_s] first_day_of_week fw unicode extension code
    # @option options [String, Symbol, #to_s] hour_cycle hc unicode extension code
    # @option options [String, Symbol, #to_s] measurement_system ms unicode extension code
    # @option options [String, Symbol, #to_s] numbering_system ns unicode extension code
    # @option options [String, Symbol, #to_s] region_override rg unicode extension code
    # @option options [String, Symbol, #to_s] subdivision sd unicode extension code
    # @option options [String, Symbol, #to_s] timezone tz unicode extension code
    # @option options [String, Symbol, #to_s] formality formality private extension code
    # @option options [String, Symbol, #to_s] territory alias for +region+
    # @option options [String, Symbol, #to_s] calendar alias for +calendar_algorithm+
    # @option options [String, Symbol, #to_s] ca alias for +calendar_algorithm+
    # @option options [String, Symbol, #to_s] cf alias for +currency_format+
    # @option options [String, Symbol, #to_s] co alias for +collation+
    # @option options [String, Symbol, #to_s] cu alias for +currency+
    # @option options [String, Symbol, #to_s] em alias for +emoji_representation+
    # @option options [String, Symbol, #to_s] fw alias for +first_day_of_week+
    # @option options [String, Symbol, #to_s] hc alias for +hour_cycle+
    # @option options [String, Symbol, #to_s] ms alias for +measurement_system+
    # @option options [String, Symbol, #to_s] nu alias for +numbering_system+
    # @option options [String, Symbol, #to_s] rg alias for +region_override+
    # @option options [String, Symbol, #to_s] sd alias for +subdivision+
    # @option options [String, Symbol, #to_s] tz alias for +timezone+
    # @return [Nii::Locale, nil] new locale instance
    # @raise [Nii::Errors::ParseError] if the code is invalid and complain is +true+
    def self.new(code = nil, complain: true, **options)
      return new(complain: complain, **code, **options) if code.is_a? Hash
      return code.to_nii_locale.with(**options) if code.respond_to? :to_nii_locale

      prototype = CACHE.fetch(code, options) do
        code, code_options = Nii::Parser.locale(code, complain: complain)
        result = super(code, **code_options)
        options.each { |k, v| result[k] = v }
        result
      end

      prototype.dup
    end

    # Similar to {.new}, but more memory efficient.
    # Does not accept options and returned objects are frozen (and thus immutable).
    def self.parse(code, complain: true)
      return code.to_nii_locale if code.respond_to? :to_nii_locale
      CACHE.fetch(code, {}) { new(code, complain: complain).freeze }
    end

    class << self
      alias_method :[], :parse
    end

    # Short-hand for the root locale (with no language, script, etc set).
    # @return [Nii::Locale]
    def self.root = parse('root')

    # @api internal
    def self._load(code) = new(code)

    # @api internal
    def _dump(level) = code

    # @api internal
    def initialize(code, **options)
      @lock    = Concurrent::ReadWriteLock.new
      @code    = code
      @options = options
      @cache   = Nii::Cache.new
      @options[:variants] ||= []
    end

    # @api internal
    def initialize_copy(other)
      super
      @lock    = Concurrent::ReadWriteLock.new
      @options = @options.dup
    end

    # @api internal
    def empty?
      false
    end

    # @return [true, false] Whether or not this is the root locale
    def root? = code == 'und'

    # A locale with the given attributes adjusted.
    # Will override any existing attributes.
    #
    # @example 
    #   Nii::Locale.new('en-US').with(region: 'GB') # => Nii::Locale["en-GB"]
    #
    # @return [Nii::Locale]
    def with(**options)
      @cache.fetch(:with, options) do
        result = dup
        options.each { |k, v| result[k] = v }
        result.freeze
      end
    end

    # A new locale without any of the unicode or private extensions.
    # Useful for converting an IETF compatible locale into a W3C compatible locale (for use in HTML and HTTP headers).
    #
    # @example
    #   Nii::Locale.new('de-DE-x-formal').without_extensions # => Nii::Locale["de-DE"]
    #
    # @return [Nii::Locale] locale without locale extensions
    def without_extensions
      @lock.with_read_lock do
        return self unless has_extensions?
        @without_extensions ||= self.class.new(language: language, script: script, region: region, variants: variants)
      end
    end

    # @return [true, false] whether or not locale has extensions
    def has_extensions?
      @lock.with_read_lock do
        @has_extensions ||= nil
        @has_extensions = @options.except(:language, :script, :region, :variants).any? if @has_extensions.nil?
        @has_extensions
      end
    end

    # @return [String, nil]
    def [](key, filter_undefined = nil)
      key              = normalize_key(key)
      filter_undefined = true if filter_undefined.nil? and key == :language
      result           = @lock.with_read_lock { @options[normalize_key(key)] }
      result unless filter_undefined and result == 'und'
    end

    def []=(key, value)
      key = normalize_key(key)
      @lock.with_write_lock do
        @without_extensions = nil
        @code               = nil
        @options[:lookup]   = nil
        @cache              = Nii::Cache.new
        @options[key]       = normalize_value(key, value)
      end
    end

    # LDML compatible lookup chain (used for CLDR data lookup).
    #
    # @example
    #   locale = Nii::Locale.parse "de-DE"
    #   locale.lookup # => [Nii::Locale["de-DE"], Nii::Locale["de"], Nii::Locale["und"]]
    #
    # @return [Array<Nii::Locale>]
    def lookup
      @lock.with_read_lock do
        recalculate unless @options[:lookup]
        @lookup ||= @options[:lookup].map { |code| self.class.new(code) }.uniq
      end
    end

    # (see Nii::Lookup::Common#available_locales)
    def available_locales(cache = true)
      @available_locales ||= Nii::LocalePreference.new(config.locale || config.available_locales || 'und')
    end

    # @return [String] BCP 47 extended locale code
    def code
      @lock.with_read_lock do
        recalculate unless @code
        @code
      end
    end

    # @return [String] code with subtags separated by the optional string argument
    def to_s(separator = '-') = separator == '-' ? code : code.tr('-', separator)

    # @example
    #   Nii::Locale.parse("de-DE").subset_of? "de" # => true
    #   Nii::Locale.parse("de").subset_of? "de-DE" # => false
    #   Nii::Locale.parse("de").subset_of? "de"    # => true
    #   Nii::Locale.parse("en").subset_of? "de"    # => false
    #
    # @param other [Nii::Locale, Nii::LocalePreference, String, Symbol, #to_nii_locale]
    # @return [true, false] whether or not the locale is a subset of the argument.
    def subset_of?(other)
      other = Locale.parse(other, complain: true) unless other.respond_to? :superset_of?
      other.superset_of? self
    end

    # @example
    #   Nii::Locale.parse("de-DE").superset_of? "de" # => false
    #   Nii::Locale.parse("de").superset_of? "de-DE" # => true
    #   Nii::Locale.parse("de").superset_of? "de"    # => true
    #   Nii::Locale.parse("en").superset_of? "de"    # => false
    #
    # @param other [Nii::Locale, Nii::LocalePreference, String, Symbol, #to_nii_locale]
    # @return [true, false] whether or not the locale is a superset of the argument.
    def superset_of?(other)
      return other.subset_of?(self) if other.is_a? LocalePreference
      other = Locale.parse(other) unless other.is_a? Locale
      return true if other.lookup.include? self
      @options.except(:lookup).all? { |key, value| value.nil? or value == 'und' or value == other[key] }
      AVAILABLE_KEYS.all? { |key| self[key, true].nil? or self[key] == other[key] }
    end

    # @param other [Nii::Locale, Nii::LocalePreference, String, Symbol, #to_nii_locale]
    #
    # @return [true, false]
    #   whether or not there is any overlap between the locale and the given argument
    #
    # @note If this method returns false, the result of calling +locale & other+ will be an empty preference.
    def combinable?(other)
      return other.combinable? self if other.is_a? LocalePreference
      other = Locale.parse(other) unless other.is_a? Locale
      return true if other == self
      AVAILABLE_KEYS.all? { |key| self[key, true].nil? or other[key, true].nil? or self[key] == other[key] }
    end

    # @example
    #   case Nii::Locale.parse "de-DE"
    #   when Nii::Locale.parse "de" then "match"
    #   end
    #   # => "match"
    #
    # @return [true, false] whether or not +other+ is a locale which is a subset of this locale
    def ===(other) = other.is_a?(Locale) && superset_of?(other)
    
    # @return [true, false] whether or not other is a locale with the same code
    def ==(other) = other.is_a?(Locale) && other.code == code
    alias_method :eql?, :==
    
    # @api internal
    def hash = code.hash

    # Combines two locales or a locale and a {Nii::LocalePreference}.
    # In set theory terms, it creates the intersection of both locales.
    #
    # @example
    #   Nii::Locale.parse('de') & Nii::Locale.new(region: 'at')
    #   # => Nii::Locale["de-AT"]
    #
    # @param other [Nii::Locale, Nii::LocalePreference, String, Symbol, #to_nii_locale]
    # @return [Nii::Locale, Nii::LocalePreference]
    def &(other)
      return other & self if other.is_a? LocalePreference
      return other if superset_of? other
      return self  if subset_of? other
      other   = Locale.parse(other) unless other.is_a? Locale
      options = AVAILABLE_KEYS.map do |key|
        value, other_value = self[key, true], other[key, true]
        if value.nil? or other_value.nil? or value == other_value
          [key, value || other_value]
        else
          return LocalePreference.new
        end
      end.to_h
      with(**options)
    end

    # Returns a locale or locale preferences that matches both locales.
    # In set theory terms, it creates the union of both locales.
    #
    # @example
    #   Nii::Locale.parse("de") | Nii::Locale.parse("en")
    #   # => => #<Nii::LocalePreference:[Nii::Locale["de"], Nii::Locale["en"]]>
    #
    #   Nii::Locale.parse("de") | Nii::Locale.parse("de-AT")
    #   # => Nii::Locale["de"]
    #
    # @return [Nii::Locale, Nii::LocalePreference]
    def |(other)
      return self  if superset_of? other
      return other if subset_of?   other
      LocalePreference.new(self, other)
    end

    # Overrides the locale's fields with fields from the other locale.
    #
    # @example
    #   Nii::Locale["de-CH"] + Nii::Locale["fr"] # => Nii::Locale["fr-CH"]
    #
    # @param other [Nii::Locale]
    # @return [Nii::Locale]
    def +(other)
      other = Locale.new(other) unless other.is_a? Locale
      Locale.new(to_h.merge(other.to_h))
    end

    alias_method :merge, :+
    
    # Removes fileds from the locale that are equal to fields present in the other locale.
    #
    # @example
    #   Nii::Locale["de-CH"] - Nii::Locale["fr-CH"] # => Nii::Locale["de"]
    #   Nii::Locale["de-CH"] - Nii::Locale["de"]    # => Nii::Locale["und-CH"]
    #   Nii::Locale["de-CH"] - Nii::Locale["fr"]    # => Nii::Locale["de-CH"]
    #
    # @param other [Nii::Locale]
    # @return [Nii::Locale]
    def -(other)
      other = Locale.new(other) unless other.is_a? Locale
      Locale.new(to_h.reject { other[_1] == _2 })
    end

    # Creates a new locale with only the given fields.
    #
    # @example
    #   locale = Nii::Locale["de-Latn-CH-x-formal"]
    #   locale.slice(:language, :region)    # => Nii::Locale["de-CH"]
    #   locale.slice(:language, :formality) # => Nii::Locale["de-x-formal"]
    #
    # @param keys [Array<Symbol>] keys for the fields to keep
    # @return [Nii::Locale]
    def slice(*keys) = Locale.new(deconstruct_keys(keys.map(&:to_sym)))

    # @api internal
    def glob_pattern
      @glob_pattern ||= if root?
        '{root,und}'
      else
        codes = [code, code.tr('-', '_'), code.downcase, code.tr('-', '_').downcase].uniq
        codes.size == 1 ? codes.first.freeze : "{#{codes.join(',')}}".freeze
      end
    end

    # Used by pattern matching without keywords.
    #
    # @example
    #   case Nii::Locale.parse "de-DE"
    #   in Nii::Locale(/^de/) then "German!"
    #   ebd
    #
    # @return [Array<String>] An array containing the {#code}.
    def deconstruct = [code]

    # Used by pattern matching with keywords.
    # Available keywords: ca, calendar, calendar_algorithm, cf, co, collation, cu, currency, currency_format, em,
    #   emoji_representation, first_day_of_week, formality, fw, hc, hour_cycle, language, measurement_system, ms, nu,
    #   numbering_system, region, region_override, rg, script, sd, subdivision, territory, timezone, tz, variants
    #
    # @example
    #   case Nii::Locale.parse "de-DE"
    #   in Nii::Locale(language: lang, region: "DE") then "#{lang} as spoken in Germany"
    #   end
    #
    # @param keys [Array<Symbol>, nil]
    def deconstruct_keys(keys)
      keys = keys ? keys & ALL_KEYS : ALL_KEYS
      keys.inject({}) { _1.merge! _2 => self[_2] }
    end

    # Turns the Locale into a Hash, with empty fields ommitted.
    # All fields are included. It is possible to hand such a Hash to {Locale.new} to turn it back into a Locale.
    #
    # @return [Hash] Hash representation of the locale.
    def to_h
      return @to_h if defined? @to_h and @to_h
      hash = AVAILABLE_KEYS.map { [_1, self[_1]] }.to_h.compact
      hash[:variants].empty? ? hash.except(:variants) : hash
    end

    # @return [self]
    def to_nii_locale = self

    # @private
    def inspect = "#{self.class.inspect}[#{code.inspect}]"

    # @private
    def freeze
      return if frozen?
      @lock = Utils::DummyLock
      @to_h = to_h.freeze

      # populate lazy methods
      has_extensions?
      without_extensions
      code.freeze
      sort_key
      lookup
      glob_pattern

      @options.freeze
      super
    end

    # @api internal
    def sort_key = @sort_key ||= AVAILABLE_KEYS.map { self[_1] || '' }

    # @api internal
    def <=>(other)
      sort_key <=> other.sort_key if other.is_a? Locale
    end

    private

    def respond_to_missing?(method, private = false)
      if method =~ /^(.+)=$/
        respond_to_missing? $1
      else
        ALL_KEYS.include? method.to_sym
      end
    end

    def recalculate
      return if frozen?
      code            = Nii::Parser::Locale.generate_code(**@options)
      @code, @options = Nii::Parser.locale(code)
      @lookup         = nil
      @glob_pattern   = nil
    end

    def method_missing(method, *arguments, &block)
      return super unless respond_to_missing? method
      if method =~ /^(.+)=$/
        raise ArgumentError, "wrong number of arguments (given #{arguments.size}, expected 1)" if arguments.size != 1
        self[$1] = arguments.first
      else
        raise ArgumentError, "wrong number of arguments (given #{arguments.size}, expected 0)" if arguments.any?
        self[method]
      end
    end

    def normalize_value(key, value)
      return unless value
      value = key == :variants ? Array(value).map { |v| Utils.string(v) } : Utils.string(value)

      case key
      when :script
        raise ArgumentError, "invalid script #{value.inspect}" unless value.size == 4
        value.capitalize
      when :language
        raise ArgumentError, "invalid language #{value.inspect}" unless value.size.between?(2, 3) or value.size.between?(5, 8) or value == 'root'
        value.downcase
      when :variants
        value.map do |variant|
          next variant.downcase if variant =~ Nii::Parser::Locale::SUBTAG_VARIANT
          raise ArgumentError, "invalid variant #{variant.inspect}"
        end
      when :region
        value = value.to_nii_territory.code if value.respond_to? :to_nii_territory
        raise ArgumentError, "invalid region #{value.inspect}" unless value =~ Nii::Parser::Locale::SUBTAG_REGION
        value.upcase
      when :region_override, :subdivision
        value  = value.to_nii_territory.code if value.respond_to? :to_nii_territory
        raise ArgumentError, "invalid region #{value.inspect}" unless region = value[/^#{Nii::Parser::Locale::SUBTAG_REGION}/]
        value == "#{region}zzzz" ? region.upcase : value.downcase
      else
        if Nii::Parser::Locale::U_SERIALIZE[key]&.include? value
          value
        else
          raise ArgumentError, "invalid #{key} #{value.inspect}" if value.size < 3
          value.downcase
        end
      end
    end

    def normalize_key(key)
      was = key
      key = key.to_sym.downcase
      key = KEY_ALIASES.fetch(key, key)
      return key if AVAILABLE_KEYS.include? key
      raise ArgumentError, "unsupported property #{was.inspect}"
    end
  end
end
