# frozen_string_literal: true

module Nii::Formats
  class HJSON < JSON
    # @api internal
    EXTENSIONS = %w[hjson]

    private
    def format_config = config.toml
    def parse(source, **) = Nii::Parser.hjson(source)
  end
end
