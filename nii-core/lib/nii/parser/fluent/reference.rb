# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Reference < Generic
      SPACE   = /(?: |\r\n|\n)*/
      PATTERN = %r{
        #{SPACE}
        (?:
          (?<prefix>\-|\$)?
          (?<key> [a-zA-Z][a-zA-Z0-9_-]* )
        )?
        (?:
          \.
          (?<attribute> [a-zA-Z][a-zA-Z0-9_-]* )
        )?
        #{SPACE}
      }x

      attr_reader :arguments, :reference_type, :attribute, :prefix, :key

      def parse
        return unless parser.scan(PATTERN) and parser.matched != ''
 
        @key       = parser[:key]
        @attribute = parser[:attribute]
        @prefix    = parser[:prefix]

        case prefix
        when '-' then @reference_type = :term
        when '$' then @reference_type = :variable
        else          @reference_type = key ? :message : :attribute
        end

        @arguments = parser.parse(:arguments) if reference_type == :term
        true
      end

      def check_placlaceable
        return true unless reference_type == :term and attribute
        parser.hint('term attributes may not be used in placeables')
      end

      def check_selector
        case reference_type
        when :term
          return true if attribute
          parser.hint('term values may not be used in selectors')
        when :message, :attribute
          parser.hint("message #{attribute ? 'attributes' : 'values'} may not be used in selectors")
        else
          true
        end
      end

      def sexp_args
        [reference_type, key, attribute, arguments&.to_sexp ]
      end

      def compile(bundle, config)
        type, key         = reference_type, self.key
        type, key         = :message, config.message_name if type == :attribute
        positional, named = arguments.compile(bundle, config) if arguments
        positional      ||= []
        named           ||= {}

        case type || reference_type
        when :term     then reference = Nii::Template::TermReference.new(bundle, key, positional, named)
        when :message  then reference = Nii::Template::MessageReference.new(bundle, key, positional, named)
        when :variable then reference = Nii::Template::Variable.new(bundle, key)
        else raise "unexpected type: #{type.inspect}"
        end

        return reference unless attribute
        Nii::Template::AttributeReference.new(bundle, reference, attribute, positional, named)
      end
    end
  end
end
