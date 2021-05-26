# frozen_string_literal: true

module Nii
  # A bundle is a grouping of messages and terms.
  # Messages can only access terms from within the same bundle.
  # Typically a namespace has one bundle per locale.
  #
  # @api internal
  class Bundle
    attr_reader :namespace, :locale

    def initialize(locale, namespace)
      @locale    = locale
      @namespace = namespace
      @messages  = Concurrent::Map.new
    end

    def add(message, type: :message)
      store = @messages.fetch_or_store(type) { Concurrent::Map.new }
      store[message.name] = message
    end

    def find(message, type: :message)
      store = @messages.fetch(type) { return }
      store[message]
    end

    def compiler(target, **options)
      if target.is_a? Symbol or target.is_a? String
        normalized = Utils.string(target).tr('-_', '').downcase
        constant   = Nii::Compiler.constants.detect { |c| c.name.downcase == normalized }
        raise Nii::CompileError, "#{target.inspect} not supported as compilation target" if constant.nil?
        target = Nii::Compiler.const_get(constant, false)
      end
      target = target.new(**options) if target.respond_to?(:new)
      target
    end

    def compile_to(target, **options)
      compiler = compiler(target, **options)
      all.each { compiler.compile(find(_1)) }
      compiler.result
    end

    def all(type: :message) = @messages.fetch(type) { return [] }.keys
    alias_method :messages, :all
  end
end
