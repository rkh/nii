# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Variant < Generic
      PATTERN = /(?<prefix>\*?)\[ *(?:\r\n|\n)? *(?:(?<number>\-?[0-9]+(?:\.[0-9]+)?)|(?<key>[a-zA-Z][a-zA-Z0-9_-]*)) *(?:\r\n|\n)? *\] */
      SPACE   = /[\r\n\s]+/
      attr_reader :is_default, :pattern, :key

      def parse
        parser.skip(SPACE)
        return unless parser.scan(PATTERN)
        @is_default = parser[:prefix] == '*'
        @type       = parser[:number] ? :number : :key
        @key        = number(parser[:number]) || parser[:key]
        @pattern    = parser.parse(:pattern)
        parser.skip(SPACE)
        true
      end

      def sexp_args
        [is_default, key, pattern.to_sexp]
      end

      def number(value)
        return unless value
        value.include?('.') ? Float(value) : Integer(value)
      end
    end
  end
end
