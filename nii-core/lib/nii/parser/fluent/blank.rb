# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Blank < Generic
      PATTERN = /(?:\s*\n|\s*\z)+/
      attr_reader :value

      def parse
        @value = parser.scan(PATTERN)
      end

      def join?(other)
        true
      end

      def sexp_args
        value
      end

      def compile(*)
      end
    end
  end
end
