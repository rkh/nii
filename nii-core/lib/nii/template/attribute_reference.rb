# frozen_string_literal: true

module Nii::Template
  class AttributeReference < Element
    attr_reader :name, :arguments

    def deconstruct = [payload, name, arguments.transform_keys { Nii::Utils.symbol(_1) }]

    def initialize(bundle, payload, name, positional_arguments, named_arguments)
      @name, @arguments = name, named_arguments.dup
      positional_arguments.each_with_index { |a, i| @arguments[i] = a }
      super(bundle, payload)
    end

    def resolve(context, variables, &block)
      attribute = context.get_attribute(payload.value(context, variables), name)
      if attribute.is_a? Element
        options = arguments.transform_values { _1.resolve(context, variables, &block) }
        attribute.resolve(context, options, &block)
      else
        raise ::Nii::FormatError, 'Cannot pass options to generic attributes' if arguments.any?
        attribute
      end
    end

    private

    def each_child(&block)
      super
      arguments.each_value(&block)
    end
  end
end
