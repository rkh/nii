# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Text < Generic
      PATTERN = /[^\n\r\{\}]+/
      SPACE   = /^ */

      attr_reader :value, :indentation

      def parse(pattern: PATTERN, max_indentation: nil)
        @max_indentation = max_indentation
        @indentation     = 0
        @value           = parser.scan(pattern)
      end

      def max_indentation
        @max_indentation ||= value[SPACE].size
      end

      def indentation=(amount)
        return unless amount and amount >= indentation
        start        = amount - indentation
        @indentation = amount
        @value       = value[start..-1] || value
      end

      def rstrip
        @value = value.rstrip
      end

      def join?(other)
        true
      end

      def join(other)
        @value = value + "\n" + other.value
      end

      def ignore?
        value.empty?
      end

      def sexp_args
        value
      end

      def compile(bundle, config)
        Nii::Template::Element.new(bundle, value)
      end
    end
  end
end
