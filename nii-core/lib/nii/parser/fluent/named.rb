# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Named < Generic
      PATTERN = /(?<key>[a-zA-Z][a-zA-Z0-9_-]*)[\n ]*:[\n ]*/
      attr_reader :key, :value
      alias_method :name, :key
      
      def parse
        return unless parser.scan(PATTERN)
        @key   = parser[:key]
        @value = parser.parse(:expression) # parser.any(:string, :number)
        !!value
      end

      def named_argument?
        true
      end

      def sexp_args
        [key, value.to_sexp]
      end

      def compile(bundle, config)
        # Arguments is taking care of our name
        value.compile(bundle, config)
      end
    end
  end
end
