# frozen_string_literal: true

module Nii::Formats
  class ARB < JSON
    # @api internal
    FORMATS = { default: [ :arb, :arb ] }

    private
    def format_config = config.arb
  end
end
