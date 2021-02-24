# frozen_string_literal: true

module Nii::Setup
  # Setup scope for an object or class inheriting {Nii::Helpers}.
  class Helpers < Vanilla
    include Shared::Routing

    # @api internal
    def self.for?(application)
      return Nii::Helpers >= application if application.is_a? Class
      application.is_a? Nii::Helpers
    end

    # @api internal
    def finalize(finalized)
      if application.is_a? Nii::Helpers
        application.instance_variable_set(:@_nii_config, finalized.config)
      else
        Nii::Config[application] = finalized.config
      end
    end
  end
end
