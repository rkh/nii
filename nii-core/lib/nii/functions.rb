# frozen_string_literal: true

module Nii
  # Public instance methods defined on this class will be available in templates.
  #
  # Given the following Fluent message:
  #
  #   example-message = { NUMBER(42) }
  #
  # Rendering this message will invoke {Nii::Functions#number}.
  class Functions < BasicObject
    # @api internal
    def self.new(context)
      super().instance_eval do
        @context = context
        self
      end
    end

    # @return [true, false]
    def self.has_function?(function)
      return false if ::BasicObject.public_method_defined? function
      public_method_defined? function
    end

    def number(value, **options) = @context.format(::Nii::Parser.number(value), **options)

    def invoke(function, ...)
      return __send__(function, ...) if ::Nii::Functions.has_function? function
      ::Kernel.raise ::Nii::Errors::UnknownFunction, "unknown function: #{function.inspect}"
    end
  end
end
