# frozen_string_literal: true

module Nii::Sinatra
  # Setup scope for Sinatra applications.
  class Setup < Nii::Setup::Vanilla
    include Nii::Setup::Shared::Routing

    def self.for?(application)
      application.is_a? Class and Sinatra::Base > application
    end

    def finalize(finalized)
      application.set :nii_config, finalized.config
      application.register Nii::Sinatra
    end
  end
end
