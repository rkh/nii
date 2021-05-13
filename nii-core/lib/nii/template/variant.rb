# frozen_string_literal: true

module Nii::Template
  class Variant < Element
    attr_accessor :default
    alias_method :default?, :default

    def initialize(bundle, condition, payload, default: false)
      @matches = Array(condition).flat_map { [_1, Nii::Utils.string(_1) ] }.uniq.compact
      @default = default
      super(bundle, payload)
    end

    def match?(*possible) = @matches.any? { possible.include? _1 }
  end
end
