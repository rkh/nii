# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Scanner < DelegateClass(StringScanner)
      def initialize(input = String.new, nodes: Fluent)
        super StringScanner.new(input)
        @nodes = nodes
      end

      def parse(key, **options)
        node(key).parse!(self, **options)
      end

      def node(key)
        @nodes[key]
      end

      def any(key = nil, *keys)
        return unless key
        parse(key) || any(*keys)
      end

      def to_ast
        reset
        parse :resource
      end

      def hint(value = nil, is_fallback = false)
        if is_fallback
          @hint_fallback = value
        else
          @hint_fallback ||= nil
          @hint          ||= value
        end

        @hint || @hint_fallback unless value
      end

      def reset_hint
        hint_was       = hint
        @hint_fallback = nil
        @hint          = nil
        hint_was
      end
    end
  end
end
