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
  end
end
