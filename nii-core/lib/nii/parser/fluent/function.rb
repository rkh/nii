# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Function < Generic
      PATTERN = /(?<key>[A-Z][A-Z0-9_-]*)/
      attr_reader :function_name, :arguments

      def parse
        return unless parser.scan(PATTERN)
        @function_name = parser[:key].downcase
        @arguments     = parser.parse(:arguments)
        !!arguments
      end

      def sexp_args
        [function_name, arguments.to_sexp]
      end

      def compile(bundle, config)
        Nii::Template::FunctionCall.new(bundle, function_name, *arguments.compile(bundle, config))
      end
    end
  end
end
