# frozen_string_literal: true

module Nii::Formats
  class HTML < TXT
    EXTENSIONS = %w[htm html xhtml]

    # @api internal
    def compile_template(bundle, source) = Nii::HTML.safe(source)
  end
end
