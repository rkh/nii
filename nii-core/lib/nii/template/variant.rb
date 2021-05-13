# frozen_string_literal: true

module Nii::Template
  class Variant < Element
    attr_accessor :default
    alias_method :default?, :default

    def initialize(bundle, condition, payload)
      @matches = [condition, Nii::Utils.string(condition)].uniq.compact
      super(bundle, payload)
    end

    def match?(*possible) = @matches.any? { possible.include? _1 }
  end
end
