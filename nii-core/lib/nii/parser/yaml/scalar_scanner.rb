# frozen_string_literal: true

module Nii::Parser::YAML
  class ScalarScanner < Psych::ScalarScanner
    NOT_SPECIAL = /^(?:on|off|yes|no|null)$/i
    def tokenize(string) = string =~ NOT_SPECIAL ? string : super
  end
end
