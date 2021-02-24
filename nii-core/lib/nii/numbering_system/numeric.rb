# frozen_string_literal: true

module Nii::NumberingSystem
  class Numeric < Generic
    # @return [true]
    def decimal? = true

    private

    def format_value(value, rules, symbols: nil, **options)
      @rules ||= data.locale_data(default_locale, :info, :numbers, :decimal_formats, code, :standard, ignore_unknown: true)
      replace_symbols(replace_digits(super(value, rules, **options)), symbols)
    end

    def replace_symbols(source, symbols)
      @base_symbols    ||= symbols('und', 'latn')
      @replace_symbols ||= @base_symbols.invert
      @replace_regexp  ||= Regexp.union(@replace_symbols.keys)
      source.gsub(@replace_regexp) do |symbol|
        key = @replace_symbols.fetch(symbol)
        symbols[key] || @base_symbols[key]
      end
    end

    def replace_digits(source)
      return source unless @replace
      Nii::Utils.string(source).gsub(/\d/) { |i| @digits[i.to_i] || i }
    end

    def setup(digits:)
      @digits  = digits
      @replace = digits != (0..9).to_a
    end
  end
end
