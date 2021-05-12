# frozen_string_literal: true

module Nii::Setup
  # Setup scope for Nii::Middleware.
  class Middleware < Vanilla
    include Shared::Routing

    # @api internal
    def self.for?(application)
      return Nii::Middleware >= application if application.is_a? Class
      application.is_a? Nii::Middleware
    end

    # @api setup
    #
    # Sets insertion point for middleware after a certain other middleware.
    # Useful to make sure the Nii context is created after some other logic is triggered,
    # that might be required to properly determine the locale.
    #
    # By default the specific framework implementation will determine the best place
    # to insert the middleware.
    def insert_before(value = Nii::UNDEFINED) = set(:insert_before, value)
  
    # @api setup
    #
    # Sets insertion point for middleware before a certain other middleware.
    # Useful to make sure the Nii context is created before some other logic is triggered,
    # that might depend on localization being available.
    #
    # By default the specific framework implementation will determine the best place
    # to insert the middleware.
    def insert_after(value = Nii::UNDEFINED) = set(:insert_after,  value)

    # @api internal
    def finalize(finalized)
      config = finalized.config
      raise Nii::Errors::SetupError, 'cannot combine insert_before and insert_after' if config.insert_before? and config.insert_after?
      Nii::Config[application] = config if application.is_a? Class
    end
  end
end
