# frozen_string_literal: true

module Nii::Template
  class AttributeReference < Element
    attr_reader :name, :arguments

    def initialize(bundle, payload, name, positional_arguments, named_arguments)
      @name, @arguments = name, named_arguments.dup
      positional_arguments.each_with_index { |a, i| @arguments[i] = a }
      super(bundle, payload)
    end

    def resolve(context, variables, &block)
      attribute = context.get_attribute(payload.value(context, variables), name)
      options   = arguments.transform_values { |a| a.resolve(context, variables, &block) }
      attribute.resolve(context, options, &block)
    end
  end
end
