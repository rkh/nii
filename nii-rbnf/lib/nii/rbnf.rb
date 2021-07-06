# frozen_string_literal: true
require 'strscan'
require 'nii/decimal_format'

module Nii
  # Implements ICU's Rule Based Number Formatter
  class RBNF
    MissingRuleSet = Class.new(ArgumentError)

    # @param source [String]
    #   The RBNF source definition.
    #
    # @param file_name [String, nil]
    #   File name to be used in error messages.
    #
    # @param plurals [#call, nil]
    #   If set, this object will be used instead of passed block for determining plural category.
    #
    # @yield [type, number] plural type and number to determine plural category from
    # @yieldparam type ["ordinal", "cardinal"] plural type for category.
    # @yieldparam number [Numeric] value to determine plural category for.
    def self.load(source, file_name = nil, plurals: nil, **options, &block) 
      Parser.new.parse(source, file_name).compile(plural_callback: plurals || block, **options)
    end

    # Loads definition from a given file.
    #
    # @param path [String, Pathname] file to load source from.
    # @param options [Hash] options passed to {.load}.
    # @param block [#to_proc, nil] block passed to {.load}.
    # @return RBNF
    # @see .load
    def self.load_file(path, **options, &block)
      load(File.read(path), path, **options)
    end

    autoload :Compiler,      'nii/rbnf/compiler'
    autoload :LenientParse,  'nii/rbnf/lenient_parse'
    autoload :Parser,        'nii/rbnf/parser'
    autoload :RuleSet,       'nii/rbnf/rule_set'
    private_constant :Compiler, :LenientParse, :Parser, :RuleSet

    # @return [Array<String>] List of supported rule sets.
    # @see #format
    attr_reader :rule_sets

    # @api internal
    def initialize(plural_callback, **options)
      @rule_sets       = []
      @plural_callback = plural_callback
      @format_options  = options
      @digits          = options[:digits]
    end

    # @param number [Numeric]
    # @return [String]
    def format(number, rule_set = 'default', **options)
      raise MissingRuleSet, "unsupported rule set #{rule_set.inspect} (supported: #{rule_sets.join(', ')})" unless has_rule? rule_set
      public_send("%#{rule_set}", number, **options)
    end

    # @param name [String]
    # @return [true, false]
    def has_rule?(name) = rule_sets.include?(name)

    # @private
    def inspect
      "#<#{self.class.inspect}:#{@rule_sets.inspect}>"
    end

    private

    def replace_digits(source)
      return source unless @digits
      source.to_s.gsub(/\d/) { |i| @digits[i.to_i] || i }
    end

    def decimal_format(number, format, **options)
      DecimalFormat[format].format(number, **@format_options, **options)
    end

    def plural_category(type, number)
      raise RuntimeError, 'no callback for determining plural category' unless @plural_callback
      @plural_callback.call(type, number)
    end
  end
end
