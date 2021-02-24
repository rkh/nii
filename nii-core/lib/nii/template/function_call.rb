# frozen_string_literal: true

module Nii::Template
  class FunctionCall < Element
    attr_reader :name, :positional_arguments, :named_arguments

    def initialize(bundle, name, positional_arguments, named_arguments)
      @name, @positional_arguments, @named_arguments = name, positional_arguments, named_arguments
      super(bundle, nil)
    end

    def resolve(context, variables, &block)
      arguments = positional_arguments.map { |a| a.resolve(context, variables, &block) }
      options   = named_arguments.transform_values { |a| a.resolve(context, variables, &block) }
      invoke(context, arguments, options, &block)
    end

    def invoke(context, arguments, options, &block)
      context.call_function(name, arguments, options, &block)
    end

    def inspect
      arguments  = positional_arguments.map(&:inspect)
      arguments += named_arguments.map { |k, v| "#{k}: #{v.inspect}" }
      "#<#{self.class.inspect}:#{name}(#{arguments.compact.join(', ')})>"
    end
  end
end
