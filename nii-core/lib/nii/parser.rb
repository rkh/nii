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
    autoload :Plural,     'nii/parser/plural'
    autoload :UnicodeSet, 'nii/parser/unicode_set'
    autoload :YAML,       'nii/parser/yaml'

    extend self
    def accept(...)      = Accept.parse(...)
    def fluent(...)      = Fluent.parse(...)
    def json(...)        = JSON.parse(...)
    def gettext(...)     = Gettext.parse(...)
    def locale(...)      = Locale.parse(...)
    def message(...)     = Message.parse(...)
    def number(...)      = Number.parse(...)
    def properties(...)  = Properties.parse(...)
    def plural(...)      = Plural.parse(...)
    def unicode_set(...) = UnicodeSet.parse(...)
    def yaml(...)        = YAML.parse(...)
  end
end
