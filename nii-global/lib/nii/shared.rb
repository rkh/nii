# frozen_string_literal: true
require 'nii/core'

module Nii
  class Shared
    attr_accessor :config
    alias_method :to_nii_config, :config

    def initialize(config = {}, &block)
      @config        = Nii::Config.new(config)
      @context_store = Concurrent::ThreadLocalVar.new
      Nii::Setup(self, &block) if block
    end

    def locale = context.locale(true)

    def locale=(value)
      self.context = Nii::Context.new(value, config)
    end

    def context = @context_store.value ||= Nii::Context.new(config)
    alias_method :to_nii_context, :context

    def context=(context)
      @context_store.value = context
      context.lookup     ||= config.lookup
    end

    def clear_context = @context_store.value = nil

    private 

    def respond_to_missing?(method, include_private = false)
      context.respond_to?(method) || super
    end

    def method_missing(method, ...)
      return super unless context.respond_to? method
      context.public_send(method, ...)
    end
  end
end
