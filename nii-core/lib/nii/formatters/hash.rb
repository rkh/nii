# frozen_string_literal: true

module Nii::Formatters
  module Hash
    extend self

    # @see Nii::Context#format
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
