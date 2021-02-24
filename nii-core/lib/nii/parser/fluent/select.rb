# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Select < Generic
      SPACE   = /[ \t\r\n]+/
      PATTERN = /(?:\r\n|\n)? *\->(?: *(?:\r\n|\n))+/
      attr_reader :expression

      def parse
        parser.skip(SPACE)
        return unless @expression = parser.parse(:expression)
        parser.skip(SPACE)

        return if expression.respond_to? :check_selector and not expression.check_selector
        return unless parser.scan(PATTERN)

        while variant = parser.parse(:variant)
          self << variant
        end

        if children.any? { |v| v.is_default }
          true
        else
          parser.hint('missing default clause')
        end
      end

      def sexp_args
        [@expression.to_sexp, *super]
      end
    end
  end
end
