# frozen_string_literal: true

module Nii::Formats
  class YAML < JSON
    # @api internal
    EXTENSIONS = %w[yml yaml]
    FORMATS    = JSON::FORMATS.except(:arb)

    private
    def format_config = config.yaml
    def parse(source, **) = Nii::Parser.yaml(source, safe: safe_parse?)
    def safe_parse? = message_format && message_format != :i18n
  end
end
