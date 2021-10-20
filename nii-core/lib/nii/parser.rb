# frozen_string_literal: true

module Nii
  # @api internal
  module Parser
    autoload :Accept,      'nii/parser/accept'
    autoload :Fluent,      'nii/parser/fluent'
    autoload :Gettext,     'nii/parser/gettext'
    autoload :HJSON,       'nii/parser/hjson'
    autoload :INI,         'nii/parser/ini'
    autoload :JSON,        'nii/parser/json'
    autoload :Locale,      'nii/parser/locale'
    autoload :Message,     'nii/parser/message'
    autoload :Number,      'nii/parser/number'
    autoload :Properties,  'nii/parser/properties'
    autoload :Plural,      'nii/parser/plural'
    autoload :TimePattern, 'nii/parser/time_pattern'
    autoload :TOML,        'nii/parser/toml'
    autoload :UnicodeSet,  'nii/parser/unicode_set'
    autoload :YAML,        'nii/parser/yaml'

    extend self
    def accept(...)       = Accept.parse(...)
    def fluent(...)       = Fluent.parse(...)
    def hjson(...)        = HJSON.parse(...)
    def ini(...)          = INI.parse(...)
    def json(...)         = JSON.parse(...)
    def gettext(...)      = Gettext.parse(...)
    def locale(...)       = Locale.parse(...)
    def message(...)      = Message.parse(...)
    def number(...)       = Number.parse(...)
    def properties(...)   = Properties.parse(...)
    def plural(...)       = Plural.parse(...)
    def time_pattern(...) = TimePattern.parse(...)
    def toml(...)         = TOML.parse(...)
    def unicode_set(...)  = UnicodeSet.parse(...)
    def yaml(...)         = YAML.parse(...)

    def load(path, format: nil)
      format ||= File.extname(path).sub(/^\./, '')
      format &&= Nii::Utils.symbol(format)
      format   = :yaml if format == :yml
      raise ArgumentError, "unsupported format: #{format}" unless Parser.instance_methods.include? format
      public_send(format, File.read(path))
    end
  end
end
