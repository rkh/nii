# frozen_string_literal: true
require 'psych'

module Nii::Parser
  # @api internal
  #
  # Wrapper around Psych with the following properties:
  # * Ignores Psych.domain_types (and thus can be used in the same process as R18n).
  # * Creates a Tagged instance for most objects (can be disabled with tagged option).
  # * Safe parsing by default to reduce risk of code injection (can be disabled with safe option).
  # * Freezes objects by default (can be disabled with freeze option).
  # * Parses on/off/yes/no/null as strings rather than true/false/nil.
  # * Aliases are supported (Psych.safe_load disables these by default).
  #
  # This behavior is inteded to give more isolation between translations and business logic,
  # and thus make the collaboration between translators and developers slightly better.
  #
  # As aliases are still supported, you should not pass user generated content to this parser.
  # An attacker could easily create a recursive structure, opening up to a DoS attack.
  # Use `Psych.safe_load` instead.
  module YAML
    autoload :ScalarScanner, 'nii/parser/yaml/scalar_scanner'
    autoload :Tagged,        'nii/parser/yaml/tagged'
    autoload :Visitor,       'nii/parser/yaml/visitor'

    extend self

    def parse(source, file_name: nil, safe: true, tagged: true, freeze: true)
      class_loader = safe ? Psych::ClassLoader::Restricted.new([], []) : Psych::ClassLoader.new
      scanner      = ScalarScanner.new(class_loader)
      visitor      = tagged ? Visitor : Psych::Visitors::ToRuby
      visitor      = visitor.new(scanner, class_loader, freeze: freeze)
      result       = Psych.parse(source, filename: file_name)
      visitor.accept(result)
    end
  end
end
