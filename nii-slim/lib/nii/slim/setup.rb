# frozen_string_literal: true

module Nii::Slim
  # Setup scope for Slim templates.
  class Setup < Nii::Setup::Vanilla
    def self.for?(application)
      application == ::Slim or application == ::Slim::Engine
    end

    def finalize(finalized)
      # Scope will look for this configuration.
      Nii::Config[::Slim] = finalized.config
    end
  end
end
