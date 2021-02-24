# frozen_string_literal: true

module Nii::Template
  class Element
    attr_reader :bundle, :payload

    def initialize(bundle, payload)
      @payload = Nii::Utils.deep_freeze(payload)
      @bundle  = bundle
    end

    def render(context,  variables, &block) = context.format(resolve(context, variables, &block))
    def resolve(context, variables, &block) = payload
    def to_nii_template                     = self
    def inspect                             = "#<#{self.class.inspect}:#{payload.inspect}>"
  end
end
