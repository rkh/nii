# frozen_string_literal: true

module Nii
  # Class representing a currency. Used for formatting money amounts and currency determination.
  #
  # Instances of this class can also be passed to Money::Currency.new from the money gem (and
  # {Currency.new} also accepts Money::Currency instances).
  #
  # @note
  #   Nii does not have a Money class (which would require implementing arithmetic operations).
  #   For formatting purposes, this isn't required, as {Nii::Formatters::Numeric} supports currency formatting.
  #   If you need money objects, we recommend either the money gem or shopify-money.
  class Currency
    PATTERN = /\A[A-Z]{3}\Z/
    private_constant :PATTERN

    # Looks up or creates a currency object.
    #
    # Instances are cached (calling new multiple times with the same code will return the same instance).
    #
    # @param code [String, Symbol, #to_nii_territory] Code identifying the currency (BCP 47/CLDR compatible).
    # @param config [nil, Hash, #to_nii_config, Nii::Data] Configuration (optional, only used to retreive CLDR data).
    # @return [Nii::Currency]
    def self.new(code, config = nil)
      return code.to_nii_currency if code.respond_to? :to_nii_currency
      data   = config if config.is_a? Nii::Data
      data ||= config ? Nii::Config.new(config).data : Nii::DATA
      code   = Utils.string(code).upcase.freeze

      data.cache(:territory, code: code) do
        raise ArgumentError, "invalid currency code: #{code.inspect}" unless code =~ PATTERN
        super(code, data)
      end
    end

    class << self
      alias_method :[], :new
    end

    # @return [Array<Nii::Currency>] list of all known currencies
    def self.all(data = Nii::DATA)
      data = Nii::Config.new(data).data unless data.is_a? Nii::Data
      data.cache(:currencies) { data.currency_data.except('DEFAULT').keys.map { new(_1, data) }.freeze }
    end

    # @return [String] Three letter code identifying the currency.
    attr_reader :code
    alias_method :to_s, :code

    # @api internal
    # @see Nii::Currency.new
    def initialize(code, data)
      @code, @data, @attributes = code, data, {}
    end

    # @return [true false] whether the currency is part of the CLDR or not
    def known? = self.class.all(@data).include?(self)

    # @!attribute [r] territories
    # @return [Array<Nii::Territory>] List of territories using the currency.
    def current_territories = get(:territories) { Array(_1).map { |code| Territory.new(code, @data) } }
    alias_method :territories, :current_territories

    # @!attribute [r] former_territories
    # @return [Array<Nii::Territory>] List of territories that used the currency in the past.
    # @note (see Nii::Territory#currencies)
    def former_territories = get(:former_territories) { Array(_1).map { |code| Territory.new(code, @data) } }

    # @!attribute [r] digits
    # The number of decimal digits customarily used for formatting. 
    # For example, in American English, the value 1 USD would format as "$1.00", and the value 1.123 USD would format as "$1.12".
    # @return [Integer] number of decimal digits.
    def digits = get(:digits) { Integer(_1) }

    # @!attribute [r] rounding
    # The rounding increment, in units of 10e-digits.
    # The default is 0, which means no rounding is to be done. Therefore, rounding=0 and rounding=1 have identical behavior.
    # Thus with fraction digits of 2 and rounding increment of 5, numeric values are rounded to the nearest 0.05 units in formatting.
    # With fraction digits of 0 and rounding increment of 50, numeric values are rounded to the nearest 50.
    # @return [Integer] rounding increment
    def rounding = get(:rounding) { Integer(_1) }

    # @!attribute [r] cash_digits
    # The number of decimal digits customarily used for formatting quantities used in cash transactions
    # (as opposed to a quantity that would appear in a more formal setting, such as on a bank statement).
    # @return [Integer] number of decimal digits used for cash amounts
    # @see #digits
    def cash_digits = get(:cash_digits) { Integer(_1 || digits) }

    # @!attribute [r] cash_rounding
    # This is the rounding increment to be used when formatting quantities used in cash transactions
    # (as opposed to a quantity that would appear in a more formal setting, such as on a bank statement).
    # @return [Integer] rounding increment for cash amounts
    # @see #rounding
    def cash_rounding = get(:cash_rounding) { Integer(_1 || rounding) }

    # @overload symbol(context = nil, locale: nil, style: :default)
    # (see #get_display)
    def symbol(...) = get_display(:symbol, ...)

    # @overload display_name(context = nil, locale: nil, style: :default)
    # (see #get_display)
    def display_name(...) = get_display(:display_name, ...)
    alias_method :name, :display_name

    # Allows pattern matching on the currency code.
    def deconstruct = [code]

    # @return [self]
    def to_nii_currency = self

    # Generates a locale representation for the currency, with no language.
    #
    # This means that most methods that expect a locale as an argument will happily accept
    # a currency instead.
    #
    # @example
    #   currency = Nii::Currency.new :USD # => #<Nii::Currency:USD>
    #   currency.to_nii_locale            # => #<Nii::Locale:und-u-cu-usd>
    #
    #   language  = Nii::Locale    :en
    #   territory = Nii::Territory :US
    #   language & territory & currency # => #<Nii::Locale:en-US-u-cu-usd>
    #
    # @return [Nii::Locale] Locale representation of the currency.
    def to_nii_locale = @locale ||= Nii::Locale.new(currency: code)

    # @private
    def inspect = "#<#{self.class.inspect}:#{code}>"

    private

    # @param context [nil, Nii::Context, Nii::Helpers, String, Symbol, #to_nii_context]
    # @param locale  [nil, Nii::Locale, String, Symbol, #to_nii_locale]
    # @param style   [Symbol, String]
    # @return [String]
    def get_display(type, context = nil, locale: nil, style: 'default', fallback: code)
      context = Context.new(context || locale)
      style   = Utils.string(style)
      locale  = context.data_locale
      result  = @data.locale_data(locale, :names, :currencies, @code, type)
      result  = result[style] || result['default'] if result.is_a? Hash
      result || fallback
    end

    def get(*keys)
      @attributes[*keys] ||= begin
        result   = @data.currency_data(@code,     *keys)
        result ||= @data.currency_data('DEFAULT', *keys)
        block_given? ? yield(result) : result
      end
    end
  end
end
