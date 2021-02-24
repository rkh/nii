# frozen_string_literal: true

module Nii
  class Namespace
    attr_reader :lookup, :name

    def initialize(lookup, name)
      @lookup = lookup
      @name   = namespace
    end

    def namespace(name)
      self.class.new(lookup, File.join(self.name, name))
    end

    def available_locales
      lookup.available_locales
    end

    def reset
      lookup.reset
    end

    def find(locale, message, namespace: nil, **options)
      namespace = namespace ? File.join(name, namespace) : name
      lookup.find(locale, message, namespace: namespace, **options)
    end
  end
end
