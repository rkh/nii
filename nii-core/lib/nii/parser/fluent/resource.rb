# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Resource < Generic
      def parse
        until parser.eos?
          parser.reset_hint
          raise 'unexpected error' unless element = parser.any(:message, :term, :comment, :blank, :junk)
          self << element
        end
        true
      end

      def to_sexp
        sexp_args
      end

      def compile(bundle, config)
        children.each { |node| node.compile(bundle, config) }
      end
    end
  end
end
