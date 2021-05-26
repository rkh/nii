# frozen_string_literal: true

module Nii::Template
  class MessageReference < FunctionCall
    def invoke(context, arguments, options, &block)
      arguments.each_with_index { |value, index| options[index] = value }
      context.render(value(context), options, namespace: bundle.namespace, &block)
    end

    def value(context, variables = nil)
      context.find_message(name, namespace: bundle.namespace) || context.unknown_message(name)
    end
  end
end
