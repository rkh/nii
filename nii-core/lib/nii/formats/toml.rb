# frozen_string_literal: true

module Nii::Formats
  class TOML < JSON
    # @api internal
    EXTENSIONS = %w[toml]
    FORMATS    = JSON::FORMATS.slice(:default)

    private
    def format_config = config.toml
    def parse(source, **) = Nii::Parser.toml(source)
  end
end
