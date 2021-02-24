# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Placeable < Generic
      attr_reader :expression
      OPEN     = /(?:\r\n|\n)?\{ */
      CLOSE    = / *\}/

      def parse
        return false unless parser.scan(OPEN)
        return false unless @expression = parser.any(:select, :expression)

        return false if expression.respond_to? :check_placlaceable and not expression.check_placlaceable
        return true  if parser.scan(CLOSE)

        parser.hint(parser.check(LINE_END) ? 'unmatched opening brace' :
          "unexpected character #{parser.peek(1).inspect}, expecting closing brace")
      end

      def to_sexp
        @expression.to_sexp
      end

      def compile(*arguments)
        expression.compile(*arguments)
      end
    end
  end
end
