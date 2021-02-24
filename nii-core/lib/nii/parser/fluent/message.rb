# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Message < MessageEntry
      def parse
        super do
          while attribute = parser.parse(:attribute)
            children << attribute
          end
        end
      end

      def has_value?
        children.any? or super
      end

      def sexp_args
        [*super, children.map(&:to_sexp)]
      end

      def message_type
        :message
      end

      def compile(bundle, config)
        config     = config.merge message_name: key
        template   = pattern.compile(bundle, config)
        attributes = {}

        children.each { |child| attributes[child.key.to_sym] = child.compile(bundle, config) }
        bundle.add(Nii::Message.new(key, template, **attributes), type: message_type)
      end
    end
  end
end
