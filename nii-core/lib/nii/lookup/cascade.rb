# frozen_string_literal: true

module Nii::Lookup
  class Cascade < Common
    # @return [Nii::Lookup::Common] list of backends
    attr_reader :backends
    alias_method :backends

    # @note Cascade also supports pattern matching on {#backends}.
    # (see Nii::Lookup::Common#deconstruct_keys)
    def deconstruct_keys(keys) = super.merge(backends: backends)

    private

    def setup        = @backends = Array(config.backends).freeze
    def reset!       = backends.each { _1.reset }
    def scan_locales = backends.map(&:available_locales).inject(:|)
  
    def load_namespace(locale, namespace)
      backends = backends_for(locale, namespace)
      [locale, namespace, backends] if backends.any?
    end
    
    def lookup((locale, namespace, backends), message)
      backends.each do |backend|
        result = backend.find(locale, message, namespace: namespace)
        return result if result
      end
      nil
    end

    def backends_for(locale, namespace)
      # this only happens on first load / reload, so filtering here may speed up things
      backends.select { _1.matches_locale?(locale) and _1.matches_namespace?(namespace) }
    end
  end
end
