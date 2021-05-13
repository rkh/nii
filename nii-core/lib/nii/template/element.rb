# frozen_string_literal: true

module Nii::Template
  class Element
    attr_reader :bundle, :payload

    def initialize(bundle, payload)
      @payload = Nii::Utils.deep_freeze(payload)
      @bundle  = bundle
    end

    def resolve(context, variables, &block)
      return payload unless payload.is_a? Element
      payload.resolve(context, variables, &block)
    end

    def render(context, variables, &block) = context.format(resolve(context, variables, &block))
    def to_nii_template = self
    def inspect = "#<#{self.class.inspect}:#{payload.inspect}>"
  end
end
