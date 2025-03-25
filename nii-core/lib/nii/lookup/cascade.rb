# frozen_string_literal: true

module Nii::Lookup
  class Cascade
    Nii::Lookup[:cascade] = self

    # @private
    def self.setup_class = Nii::Setup::Lookup::Cascade

    # @return [Nii::Lookup::Common] list of backends
    attr_reader :backends
    alias_method :deconstruct, :backends

    # @note Cascade also supports pattern matching on {#backends}.
    # (see Nii::Lookup::Common#deconstruct_keys)
    def deconstruct_keys(keys) = super.merge(backends: backends)

    # @param config [#to_nii_config, #to_h]
    def initialize(config)
      config    = Nii::Config.new(config)
      config    = Nii::Config.new(config.lookup) if config.lookup
      @backends = Array(config.backends).freeze
    end

    # @return [Nii::Message, nil]
    def find(...)
      backends.each do |backend|
        result = backend.find(...)
        return result if result
      end
      nil
    end

    # @return [Nii::LocalePreference]
    def available_locales(...)
      backends.map(&:available_locales).inject(:|)
    end

    # @api internal
    def matches?(locale, namespace, message)
      backends.any? { _1.matches?(locale, namespace, message) }
    end

    # @api internal
    def matches_locale?(locale) = backends.any? { _1.matches_locale?(locale) }

    # @api internal
    def matches_namespace?(namespace)
      backends.any? { _1.matches_namespace?(namespace) }
    end

    # Add another backend to the cascade.
    #
    # @param backend [Nii::Lookup::Common]
    # @return [self]   
    def <<(backend)
      @backends = backends + [backend]
      @backends.freeze
      self
    end

    # Resets all cached and aggregated data (locales, file storage, etc).
    # This is a full reset. For development it is faster to enabled the reload_templates option.
    #
    # @return [self]
    def reset
      backends.each { _1.reset }
      self
    end
  end
end
