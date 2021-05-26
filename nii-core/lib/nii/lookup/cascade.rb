# frozen_string_literal: true

module Nii::Lookup
  class Cascade < Common
    attr_reader :backends

    def deconstruct = backends
    def deconstruct_keys(keys) = super.merge(backends: backends)

    private

    def setup                                         = @backends = Array(config.backends).freeze
    def reset!                                        = backends.each { _1.reset }
    def load_namespace(locale, namespace)             = backends_for(locale, namespace).map { [locale, namespace, _1] }
    def lookup((locale, namespace, backend), message) = lookup.find(locale, message, namespace: namespace)

    def backends_for(locale, namespace)
      # this only happens on first load / reload, so filtering here may speed up things
      backends.select do |backed|
        backend.matches_locale?(locale) and backend.matches_namespace?(namespace)
      end
    end
  end
end
