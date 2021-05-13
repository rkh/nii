# frozen_string_literal: true

module Nii::Template
  class Select < Element
    def initialize(bundle, payload, variants)
      @variants = variants
      @default  = variants.detect { _1.default? }
      super(bundle, payload)
    end

    def resolve(context, variables, &block)
      value    = super
      category = context.grammar.plurals.classify(value, complain: false)&.name
      values   = [value, Nii::Utils.string(value), category].compact.uniq
      variant  = @variants.detect { _1.match?(*values) } || @default
      variant&.resolve(context, variables, &block)
    end
  end
end
