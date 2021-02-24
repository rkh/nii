# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class MessageEntry < Generic
      attr_reader :key, :pattern
      PATTERN = /(?<key>[a-zA-Z][a-zA-Z0-9_-]*) *= */

      def parse
        return unless parser.scan(PATTERN)
        @key     = parser[:key]
        @pattern = parser.parse(:pattern)

        yield if block_given?

        return true if has_value?
        parser.hint('missing value') if pattern or parser.scan(LINE_END)
      end

      def has_value?
        pattern and pattern.children.any? { |c| !c.ignore? }
      end

      def sexp_args
        [key, pattern.to_sexp]
      end
    end
  end
end
