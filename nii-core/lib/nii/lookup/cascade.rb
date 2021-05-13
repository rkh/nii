# frozen_string_literal: true

module Nii::Lookup
  class Cascade < Common
    Nii::Lookup[:cascade] = self

    # @private
    def self.setup_class = Nii::Setup::Lookup::Cascade

    attr_reader :backends

    private

    def setup
      @backends = Array(config.backends)
    end

    def reset!
      backends.each { |backend| backend.reset }
    end

    def backends_for(locale, namespace)
      # this only happens on first load / reload, so filtering here may speed up things
      backends.select do |backed|
        backend.matches_locale?(locale) and backend.matches_namespace?(namespace)
      end
    end

    def load_namespace(locale, namespace)
      backends_for(locale, namespace).map { |backend| [locale, namespace, backend] }
    end

    def lookup((locale, namespace, backend), message)
      lookup.find(locale, message, namespace: namespace)
    end
  end
end
