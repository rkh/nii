# frozen_string_literal: true

module Nii
  module Info
    autoload :Generic,           'nii/info/generic'
    autoload :Grammar,           'nii/info/grammar'
    autoload :Html,              'nii/info/html'
    autoload :MeasurementSystem, 'nii/info/measurement_system'
    autoload :Numbers,           'nii/info/numbers'
    autoload :Time,              'nii/info/time'
    autoload :Text,              'nii/info/text'

    # @api internal
    module ES
      autoload :Text, 'nii/info/es/text'
    end

    # @api internal
    module HE
      autoload :Text, 'nii/info/he/text'
    end

    # @api internal
    def self.[](key, locale = nil)
      return unless key =~ /^[a-z][_a-z]+$/
      locale &&= Locale.parse(locale).language&.upcase
      key      = key.name if key.is_a? Symbol
      @cache ||= {}
      @cache.fetch([key, locale]) do
        const_name  = key.split('_').map(&:capitalize).join
        namespace   = const_get(locale)                if locale and const_defined? locale, false
        constant    = namespace.const_get(const_name)  if namespace&.const_defined? const_name, false
        constant  ||= const_get(const_name)            if const_defined? const_name
        constant    = nil unless constant.respond_to? :new and constant != Generic
        @cache[[key, locale]] = constant
      end
    end
  end
end
