# frozen_string_literal: true

module Nii
  # @api internal
  class ScopeOptions
    def self.new(constructor)
      return constructor if constructor.is_a? ScopeOptions
    end

    def initialize
      @rules = []
    end

    def for(object)
      options = {}
      @rules.each do |matcher, rule_options, block|
        next unless matcher === object
        block_options = block.call(object)
        options.merge! rule_options  if rule_options
        options.merge! block_options if block_options
      end
      options
    end

    def set(matcher, options = nil, &block)
      @rules << [matcher, options, block]
    end
  end
end
