# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Junk < Generic
      PATTERN = /[^\n]*\n|[^\n]*\z/
      attr_reader :hint, :value

      def parse
        @value = parser.scan(PATTERN)
        @hint  = parser.reset_hint
        true
      end

      def join(other)
        @value += other.value
      end

      def join?(other)
        other.hint.nil?
      end

      def sexp_args
        [value, hint]
      end

      def compile(bundle, config)
        # TODO
        raise "found junk: #{hint}"
      end
    end
  end
end
