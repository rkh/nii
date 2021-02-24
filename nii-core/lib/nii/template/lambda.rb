# frozen_string_literal: true

module Nii::Template
  class Lambda < Element
    def initialize(bundle, &payload)        = super(bundle, payload)
    def resolve(context, variables, &block) = payload.call(context, variables, &block)
  end
end
