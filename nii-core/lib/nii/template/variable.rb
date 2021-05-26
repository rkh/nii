# frozen_string_literal: true

module Nii::Template
  class Variable < Element
    attr_reader :default
    def deconstruct = [payload, default]

    def initialize(bundle, payload, default = Nii::UNDEFINED)
      @default = default
      super(bundle, payload)
    end

    def resolve(context, variables, default = self.default, &block)
      variable = context.normalize_variable_name(payload)
      result   = variables.fetch(variable, default)
      result   = result.resolve(context, variables) if result.is_a? Element
      result   = context.unknown_variable(variable, variables) if result == Nii::UNDEFINED

      # todo: we should wrap this in some sort of wrapper, so we can access attributes etc
      context.format_variable! variable, result
    end

    alias_method :value, :resolve
    alias_method :name, :payload

    private
    def each_child(&block) = nil
  end
end
