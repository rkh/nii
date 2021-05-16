# frozen_string_literal: true

module Nii
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

    # @return [String] Three letter code identifying the currency.
    attr_reader :code
    alias_method :to_s, :code

    # @api internal
    # @see Nii::Currency.new
    def initialize(code, data)
      @code, @data = code, data
    end

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
  end
end
