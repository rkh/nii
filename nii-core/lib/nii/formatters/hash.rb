# frozen_string_literal: true

module Nii::Formatters
  module Hash
    extend self

    # @see Nii::Context#format
    #
    # @example
    #   data = { de: 60000, us: 100000 }
    #
    #   context = Nii::Context.new(:en)
    #   context.format(data, keys: :country, values: { style: :currency, currency: "USD" })
    #   # => "Germany: $60,000 and United States: $100,000"
    #
    # @option (see Array.format)
    #
    # @option option [String, Symbol, Hash] keys
    #   Formatting options only applied to the hash keys.
    #
    # @option option [String, Symbol, Hash] values
    #   Formatting options only applied to the hash values.
    #
    # @!scope module
    def format(context, value, **options)
      key_options   = options(options, :keys)
      value_options = options(options, :values)

      Array.format(context, value, list_style: options[:list_style]) do |key, entry|
        entry   = yield(entry) if block_given?
        entry &&= context.format(entry, **value_options)
        next entry unless key and entry
        context.html(context.text.key_type_pattern, context.format(key, **key_options), entry, **options)
      end
    end

    # @api internal
    def yield?(value) = false

    private

    def options(hash, key)
      case options = hash[key]
      when nil            then hash
      when String, Symbol then hash.except(key).merge(as: options)
      when Hash           then hash.except(key).merge(options)
      else raise ArgumentError, "invalid option #{key}: #{hash.inspect}"
      end
    end
  end
end
