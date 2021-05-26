# frozen_string_literal: true

module Nii
  class Territory
    include Helpers::Territories

    # @api internal
    WORLD_CODE = '001'
    extend Enumerable

    # Looks up or creates a territory object.
    #
    # Instances are cached (calling new multiple times with the same code will return the same instance).
    #
    # @param code [String, Symbol, Integer, #to_nii_territory] Code identifying the territory (BCP 47/CLDR compatible).
    # @param config [nil, Hash, #to_nii_config, Nii::Data] Configuration (optional, only used to retreive CLDR data).
    # @return [Nii:Territory]
    def self.new(code, config = nil)
      return code.to_nii_territory if code.respond_to? :to_nii_territory
      data   = config if config.is_a? Nii::Data
      data ||= config ? Config.new(config).data : Nii::DATA
      code   = "%03d" % code if code.is_a? Integer
      code &&= Nii::Utils.string(code).upcase
      code ||= WORLD_CODE

      data.cache(:territory, code: code) do
        if resolved = data.resolve_alias(:territory, code) and resolved != code
          new(resolved, data)
        else
          territory = super(code, data)
          throw :no_cache, territory unless territory.known?
          territory
        end
      end
    end

    class << self
      alias_method :[], :new
    end

    # @return [Array<Nii::Territory>] list of all known territories.
    def self.all(data = Nii::DATA)
      data = Nii::Config.new(data).data unless data.is_a? Nii::Data
      data.cache(:territories) { data.territories.map { self[_1] }.uniq }
    end

    # @yield [territory] Block called for each territory.
    # @yieldparam territory [Nii::Territory]
    def self.each(&block) = all.each(&block)

    # @api internal
    def self._load(code) = new(code)

    # @api internal
    def _dump(level) = code

    # @return [String] BCP 47 territory code
    attr_reader :code

    # @api internal
    # @see Nii::Territory.new
    def initialize(code, data)
      @code, @data, @attributes = code, data, {}
    end

    # Checks if the territory or any of its (transitive) parents matches the given argument.
    #
    # @example
    #   Nii::Territory[:US].within? :EU # => false
    #   Nii::Territory[:DE].within? :EU # => true
    #
    # @param territory [Nii::Territory, String, Symbol, Integer, #to_nii_territory]
    # @return [true, false] Whether or not one territory is within another.
    # @see #include?
    # @see #matches?
    def within?(territory)
      territory = Territory.new(territory, @data)
      return true if territory.code == WORLD_CODE
      return true if self == territory
      parents.any? { _1.within? territory }
    end

    # Checks if the territory or any of its (transitive) divisions matches the given argument.
    #
    # @example
    #   Nii::Territory[:EU].inlcude? :US # => false
    #   Nii::Territory[:EU].inlcude? :DE # => false
    #
    # @param territory [Nii::Territory, String, Symbol, Integer, #to_nii_territory]
    # @return [true, false] Whether or not one territory is within another.
    # @see #within?
    # @see #matches?
    def include?(territory) = Territory.new(territory).within?(self)
    
    # Whether or not two territories have a child-parent (or parent-child) relation.
    #
    # @example
    #    Nii::Territory[:EU].matches? :US # => false
    #    Nii::Territory[:US].matches? :EU # => false
    #    Nii::Territory[:EU].matches? :DE # => true
    #    Nii::Territory[:DE].matches? :EU # => true
    #
    # @param territory [Nii::Territory, String, Symbol, Integer, #to_nii_territory]
    # @return [true, false] Whether or not one territory is within another.
    # @see #include?
    # @see #within?
    def matches?(territory) = within?(territory) || include?(territory)

    # @overload currencies(include_previous = false)
    #   List of the territory's currencies.
    #   Will include historic currencies if +include_previous+ is set to true.
    #
    #   @example Territory with multiple currencies
    #     panama = Nii::Territory.new :PA # => #<Nii::Territory:PA (Panama)>
    #     panama.currencies               # => [#<Nii::Currency:PAB>, #<Nii::Currency:USD>]
    #
    #   @example Territory with historic currency
    #     france = Nii::Territory.new :FR # => #<Nii::Territory:FR (France)>
    #     france.currencies               # => [#<Nii::Currency:EUR>]
    #     france.currencies true          # => [#<Nii::Currency:EUR>, #<Nii::Currency:FRF>]
    #
    #   @param include_previous [true, false] Whether or not to include past currencies.
    #
    # @overload currencies(date)
    #   List of currencies used in the territory on the given date or in the given year.
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currencies "2019-12-31" # => [#<Nii::Currency:EUR>]
    #     france.currencies 1990         # => [#<Nii::Currency:FRF>]
    #
    #   @param date [Date, #to_date, String, Integer, nil] Exact date or year.
    #
    # @overload currencies(date_range)
    #   List of all currencies used in the given date or year range.
    #
    #   @example
    #     france.currencies 1990..2010 # => [#<Nii::Currency:EUR>, #<Nii::Currency:FRF>]
    #
    #   @param date_range [Range] A range of dates or years.
    #
    # @overload currencies(after, before)
    #   List of all currencies used between the first and the second date (or year).
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currencies "1990-01-01", "2010-01-01" # => [#<Nii::Currency:EUR>, #<Nii::Currency:FRF>]
    #
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # @overload currencies(after: nil, before: nil)
    #   List of currencies before and/or after given dates or years.
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currencies before: 2000 # => [#<Nii::Currency:EUR>, #<Nii::Currency:FRF>]
    #
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # @note
    #   Information about historic currency use is limited and in most cases only includes recent currencies,
    #   like a country switching to EUR.
    #
    # @return [Array<Nii::Currency>] List of currencies.
    # @see #currency?
    def currencies(*args)
      return [] unless known?
      case args
      in [ ]  |  [ false ] then @current_currencies ||= current_currencies
      in [ true          ] then @all_currencies     ||= currency_ranges.map(&:first).uniq.freeze
      in [ Range => a    ] then currencies(a.first, a.exclude_end? ? a.last - 1 : a.last)
      in [ Hash => a     ] then currencies(*a.values_at(:after, :before))
      in [ date          ] then currencies(date, date)
      in [ after, before ]
        after         = ::Date.new(after, 1, 1) if after.is_a? Integer
        after       &&= String === after  ? ::Date.parse(after)  : after.to_date
        before        = ::Date.new(before, 12, 31) if before.is_a? Integer
        before      &&= String === before ? ::Date.parse(before) : before.to_date
        after, before = before, after if before and after and before < after

        currency_ranges.map do |currency, from, to|
          next if to   and after  and after > to
          next if from and before and before < from
          currency
        end.compact.uniq
      end
    end

    # @overload currency
    #   The territory's currency.
    #   Picks the most current currency if multiple currencies are valid.
    #
    #   @example
    #     panama = Nii::Territory.new :PA # => #<Nii::Territory:PA (Panama)>
    #     panama.currency                # => #<Nii::Currency:PAB>
    #
    # @overload currency(date)
    #   Currency used in the territory on the given date or in the given year
    #   Picks the most current currency if multiple currencies are valid..
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currency "2019-12-31" # => #<Nii::Currency:EUR>
    #     france.currency 1990         # => #<Nii::Currency:FRF>
    #
    #   @param date [Date, #to_date, String, Integer, nil] Exact date or year.
    #
    # @overload currency(date_range)
    #   Currency used in the territory during a given date or year range.
    #   Picks the most current currency if multiple currencies are valid.
    #
    #   @example
    #     france.currency 2010..2020 # => #<Nii::Currency:EUR>
    #
    #   @param date_range [Range] A range of dates or years.
    #
    # @overload currency(after, before)
    #   The territory's currency used between the first and the second date (or year).
    #   Picks the most current currency if multiple currencies are valid.
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currency "1990-01-01", "2010-01-01" # => #<Nii::Currency:EUR>
    #
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # @overload currency(after: nil, before: nil)
    #   The territory's currency before and/or after given dates or years.
    #   Picks the most current currency if multiple currencies are valid.
    #
    #   @example
    #     france = Nii::Territory.new :FR
    #     france.currency before: 1990 # => #<Nii::Currency:FRF>
    #
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # @note (see #currencies)
    # @return [Nii::Currency]
    # @see #currencies
    def currency(...) = currencies(...).first

    # @overload currency?(currency, include_previous = false)
    #   @param currency [String, Symbol, Nii::Currency, Money::Currency, #to_s]
    #     the currency or currency symbol. Also accepts currency objects from the money gem.
    #   @param include_previous [true, false] Whether or not to include past currencies.
    #
    # @overload currency?(currency, date)
    #   @param currency [String, Symbol, Nii::Currency, Money::Currency, #to_s]
    #     the currency or currency symbol. Also accepts currency objects from the money gem.
    #   @param date [Date, #to_date, String, Integer, nil] Exact date or year.
    #
    # @overload currency?(currency, date_range)
    #   @param currency [String, Symbol, Nii::Currency, Money::Currency, #to_s]
    #     the currency or currency symbol. Also accepts currency objects from the money gem.
    #   @param date_range [Range] A range of dates or years.
    #
    # @overload currency?(currency, after, before)
    #   @param currency [String, Symbol, Nii::Currency, Money::Currency, #to_s]
    #     the currency or currency symbol. Also accepts currency objects from the money gem.
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # @overload currency?(currency, after: nil, before: nil)
    #   @param currency [String, Symbol, Nii::Currency, Money::Currency, #to_s]
    #     the currency or currency symbol. Also accepts currency objects from the money gem.
    #   @param after  [Date, #to_date, String, Integer, nil]
    #   @param before [Date, #to_date, String, Integer, nil]
    #
    # Checks whether or not a currency is or has been valid for a territory.
    # Also accepts Strings and Symbols.
    #
    # @example
    #   france = Nii::Territory.new :FR
    #   france.currency? :USD       # => false
    #   france.currency? :EUR       # => true
    #   france.currency? :FRF       # => false
    #   france.currency? :FRF, true # => true
    #   france.currency? :EUR, 1990 # => false
    #
    # @note (see #currencies)
    # @return [true, false] Whether or not +currency+ is/was legal tender in the territory.
    # @see #currencies
    def currency?(currency, ...) = currencies(...).include?(Nii::Currency.new(currency, @data))

    # @return [true, false] Whether or not the territory is part of the CLDR data set.
    def known? = @data.territory_known?(code)

    # @return [String] Measurement system used in the territory (+metric+, +US+, or +UK+).
    def measurement_system = get(:measurement_system) || 'metric'

    # @return [String] Paper size used in the territory (+A4+ or +US-Letter+).
    def paper_size = get(:paper_size) || 'A4'

    # @return [String] Temperature system used in the territory (+metric+, +US+, or +UK+).
    # @note This does not directly indicate whether to use Fahrenheit or Celsius, as the UK uses both.
    def temperature = get(:temperature) || 'metric'

    # @return [Array<Nii::Territory>] List of (direct) partent territories.
    def parents = get(:parents) { |codes| Array(codes).map { |c| Territory.new(c, @data) }} || []

    # @return [Array<Nii::Territory>] List of (direct) territories within the territory.
    # @note
    #   Subdivisions are currently not included (this data is technically part of the CLDR, but not currently part of Nii).
    #   If subdivisions are needed, we recommend using the countries gem.
    def territories = get(:contains) { |codes| Array(codes).map { |c| Territory.new(c, @data) }} || []
    alias_method :children,  :territories
    alias_method :divisions, :territories

    def deconstruct = [code]

    def deconstruct_keys(keys)
      @deconstruct_keys ||= {
        code:               code,
        currencies:         currencies,
        currency:           currency,
        known:              known?,
        measurement_system: measurement_system,
        paper_size:         paper_size,
        temperature:        temperature,
        parents:            parents,
        territories:        territories,
        children:           children,
        divisions:          divisions
      }.freeze
    end

    # Generates a locale representation for the territory, with no language.
    #
    # This means that most methods that expect a locale as an argument will happily accept
    # a territory instead.
    #
    # @example
    #   territory = Nii::Territory.new :de # => #<Nii::Territory:DE (Germany)>
    #   territory.to_nii_locale            # => #<Nii::Locale:und-DE>
    #
    #   Nii::Locale.new(:de) & Nii::Territory.new(:at) # => #<Nii::Locale:de-AT>
    #
    # @return [Nii::Locale] Locale representation of the territory.
    def to_nii_locale = @locale ||= Locale.new(territory: code)

    # @return [self]
    def to_nii_territory = self

    # @private
    def inspect
      names  = @data.locale_data(:en, :names, :territories, code)
      name   = names['short'] || names['default'] if names
      name ||= code
      name  == code ? "#<#{self.class}:#{code}>" : "#<#{self.class}:#{code} (#{name})>"
    end

    private

    def current_currencies = get(:currencies, :current) { |c| Array(c).map { Currency.new(_1, @data) }}

    def currency_ranges
      get(:currencies, :all) do |list|
        list.reverse_each.map do |info|
          from = ::Date.parse(info['from']) if info['from']
          to   = ::Date.parse(info['to'])   if info['to']
          [Currency.new(info.fetch('currency')), from, to]
        end
      end
    end

    def get(*key)
      return unless known?
      @attributes[key] ||= begin
        result = @data.territory_data(code, *key)
        result = yield(result) if block_given?
        result&.freeze
      end
    end
  end
end
