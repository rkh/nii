# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Number < Generic
      attr_reader :value
      PATTERN = /\-?[0-9]+(?:\.[0-9]+)?/

      def parse
        @value = parser.scan(PATTERN)
        @value &&= value.include?('.') ? Float(value) : Integer(value)
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
