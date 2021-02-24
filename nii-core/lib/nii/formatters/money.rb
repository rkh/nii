# frozen_string_literal: true

module Nii::Formatters
  module Money
    extend self

    # @see Nii::Context#format
    # @note
    #   This method can handle the Money class from both the money and the shopify-money gems, as well as custom Money implementations.
    #
    #   If the currency option is not given, it will attempt to use +value.currency.iso_code+ or +value.currency+ to determine the
    #   currency code (which should return something like +USD+ or +EUR+).
    #
    #   If the currency option is given, and the object implements +to_money+ (which both the money and the shopify-money gems do),
    #   it will convert the value to the currency by calling +value.to_money(currency)+.
    #
    #   It will then determine the value by calling either +to_r+, +to_d+, +to_f+, or +to_i+ on the value.
    #
    # @example With RubyMoney
    #   require 'money'
    #   money   = Money.new(10_00, "USD")
    #   context = Nii::Context.new(:en)
    #   context.format money # => "$10.00"
    #
    # @example With a custom Money object
    #   Money   = Struct.new(:currency, :amount) { def to_r = amount.to_r }
    #   money   = Money.new(:usd, 10)
    #   context = Nii::Context.new(:en)
    #   context.format money # => "$10.00"
    #
    # @option (see Nii::Formatters::Numeric.format)
    # @!scope module
    def format(context, value, **options)
      if currency = options[:currency]
        value = value.to_money(currency) if value.respond_to? :to_money
      else
        currency ||= money.currency
        currency  &= currency.iso_code if currency.respond_to? :iso_code
        currency  &= Nii::Utils.string(currency)
      end
  
      amount = value.to_r if value.respond_to? :to_r
      amount = value.to_d if amount.nil? and value.respond_to? :to_d
      amount = value.to_f if amount.nil? and value.respond_to? :to_f
      amount = value.to_i if amount.nil? and value.respond_to? :to_i
      amount = (amount || value).to_r
  
      context.format(value.to_f, style: 'currency', **options)
    end
  end
end
