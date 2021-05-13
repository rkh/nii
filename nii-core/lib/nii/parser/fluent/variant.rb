# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Variant < Generic
      PATTERN = /(?<prefix>\*?)\[ *(?:\r\n|\n)? *(?:(?<number>\-?[0-9]+(?:\.[0-9]+)?)|(?<key>[a-zA-Z][a-zA-Z0-9_-]*)) *(?:\r\n|\n)? *\] */
      SPACE   = /\s+/
      attr_reader :is_default, :pattern, :key

      def parse
        parser.skip(SPACE)
        return unless parser.scan(PATTERN)
        @is_default = parser[:prefix] == '*'
        @type       = parser[:number] ? :number : :key
        @key        = parser[:number] ? number(parser[:number]) : parser[:key]
        @pattern    = parser.parse(:pattern)
        parser.skip(SPACE)
        true
      end

      def number(value) = value.include?('.') ? Float(value) : Integer(value)

      def sexp_args
        [is_default, key, pattern.to_sexp]
      end

      def compile(bundle, config)
        Nii::Template::Variant.new(bundle, key, pattern.compile(bundle, config), default: is_default)
      end
    end
  end
end
