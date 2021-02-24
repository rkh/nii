# frozen_string_literal: true

module Nii::NumberingSystem
  class Generic
    attr_reader :code, :data, :default_locale

    def initialize(code, data, default_locale: 'und', **options)
      @code, @data, @default_locale = code, data, default_locale
      setup(**options)
    end

    def default_symbols
      symbols(@default_locale, code)
    end

    # @see Formatters::Numeric#format
    # @see Info::Numbers.format_rules
    def format(value, rules, **options) = format_value(value, rules, **options)

    def to_nii_number_system
      self
    end

    def decimal?
      raise NotImplementedError, 'subclass responsibility'
    end

    # @private
    def inspect
      "#<#{self.class.inspect}:#{code.inspect}>"
    end

    private

    def format_value(value, rules, **options)
      case rules
      when nil    then Nii::Utils.string(value)
      when String then Nii::DecimalFormat[rules].format(value, **options)
      else raise RuntimeError, "unsupported formatting rules: #{rules.inspect}"
      end
    end

    def symbols(locale, system)
      data.locale_data(locale, :info, :numbers, :symbols, system, ignore_unknown: true) || {}
    end
  end
end
