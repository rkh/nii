# frozen_string_literal: true

module Nii::Formats
  class XLIFF < XML
    EXTENSIONS      = %w[xlf xliff]
    def base_format = Nii::XML::XLIFF
  end
end
