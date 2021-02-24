# frozen_string_literal: true

module Nii::Setup
  # Setup scope for Nii::Global and other Nii::Shared instances.
  class Global < Vanilla
    # @api internal
    def self.for?(application) = application.is_a?(Nii::Shared)

    # @api internal
    def finalize(finalized)
      application.config = application.config.merge(finalized.config)
    end
  end
end
