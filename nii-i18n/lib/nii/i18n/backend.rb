# frozen_string_literal: true
require 'i18n'

module Nii::I18n
  class Backend
    attr_reader :config

    def initialize(config = {})
      @config = Nii::Config.new(config)

      unless @config.i18n_backend
        i18n_backend = ::I18n.config.backend # try to capture this right before asignment
        i18n_backend = i18n_backend.config.i18n_backend while i18n_backend&.config&.i18n_backend
        @config      = @config.merge(i18n_backend: i18n_backend)
      end
    end

    def translate(locale, key, options = ::I18n::EMPTY_HASH)
      message, namespace = parse_message(key, options)
      context(locale, options).render(message, namespace: namespace)
    end

    def exists?(locale, key, options = ::I18n::EMPTY_HASH)
      message, namespace = parse_message(key, options)
      !!context(locale, options).find_message(message, namespace: namespace)
    end

    def localize(locale, object, format = :default, options = ::I18n::EMPTY_HASH)
      context(locale, options).format(object, format)
    end
 
    def available_locales
      return config.available_locales.to_a        if config.available_locales
      return config.lookup.available_locales.to_a if config.lookup
      @available_locales ||= config.data.available_locales
    end

    def store_translations(locale, data, options = EMPTY_HASH)
      raise NotImplementedError, 'store_translation not currently supported by Nii::I18n'
    end

    def reload!
      config.lookup&.reset
    end

    def eager_load!
    end

    private

    def parse_message(key, options)
    end

    def context(locale, options)
      Nii::Context.new(locale, config) do |context|
        context.variables = options.except(*::I18n::RESERVED_KEYS)
      end
    end
  end
end
