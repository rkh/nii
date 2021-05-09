# frozen_string_literal: true

module Nii
  # @api internal
  module Parser
    autoload :Accept,     'nii/parser/accept'
    autoload :Fluent,     'nii/parser/fluent'
    autoload :Gettext,    'nii/parser/gettext'
    autoload :JSON,       'nii/parser/json'
    autoload :Locale,     'nii/parser/locale'
    autoload :Message,    'nii/parser/message'
    autoload :Number,     'nii/parser/number'
    autoload :Properties, 'nii/parser/properties'
    autoload :YAML,       'nii/parser/yaml'

    def self.accept(source,      **options) = Accept     .parse(source, **options)
    def self.fluent(source,      **options) = Fluent     .parse(source, **options)
    def self.json(source,        **options) = JSON       .parse(source, **options)
    def self.gettext(source,     **options) = Gettext    .parse(source, **options)
    def self.locale(source,      **options) = Locale     .parse(source, **options)
    def self.message(source,     **options) = Message    .parse(source, **options)
    def self.number(source,      **options) = Number     .parse(source, **options)
    def self.properties(source,  **options) = Properties .parse(source, **options)
    def self.yaml(source,        **options) = YAML       .parse(source, **options)
  end
end
