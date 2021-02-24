# frozen_string_literal: true

module Nii::I18n
  # Setup scope for Ruby I18n.
  class Setup < Nii::Setup::Vanilla
    def self.for?(application)
      application == ::I18n
    end

    def finalize(finalized)
      application.backend   = Nii::I18n::Backend.new   finalized.config
      application.fallbacks = Nii::I18n::Fallbacks.new finalized.config
    end
  end
end
