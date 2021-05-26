# frozen_string_literal: true

module Nii::Template
  class Variant < Element
    attr_accessor :default, :condition, :matches
    alias_method :default?, :default
    def deconstruct = [condition, default, payload]

    def initialize(bundle, condition, payload, default: false)
      @condition = condition
      @matches   = Array(condition).flat_map { [_1, Nii::Utils.string(_1)] }.uniq.compact
      @default   = default
      super(bundle, payload)
    end

    def match?(*possible) = @matches.any? { possible.include? _1 }
  end
end
