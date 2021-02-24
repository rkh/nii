# frozen_string_literal: true

module Nii::Rails
  # Setup scope for Rails applications and engines.
  class Setup < Nii::Setup::Vanilla
    include Nii::Setup::Shared::Routing

    # @api internal
    def self.for?(application)
      return false unless defined? ::Rails::Engine
      return appliaction < ::Rails::Engine if application.is_a? Class
      application == ::Rails or application.is_a? ::Rails::Engine
    end

    # @api internal
    def initialize(application)
      application = application.application if application == ::Rails
      super
    end

    # @api internal
    def finalize(finalized)
      @application.config.nii = finalized.config
      finalize_middleware(finalized)
      finalize_i18n(finalized)
    end

    def middleware(value = Nii::UNDEFINED) = set(:middleware, value, Nii::Middleware)

    private

    def finalize_i18n(finalized)
      return if finalized[::I18n] # someone set it up explicitly
      ::I18n.fallbacks = Nii::I18n::Fallbacks.new(finalized.config)
    end

    def finalize_middleware(finalized)
      return unless middleware
      setup  = finalized[middleware] || finalized
      config = setup.config
      stack  = @application.config.middleware

      # insert the main middleware
      if config.insert_before?   then stack.insert_before config.insert_before, middleware, config
      elsif config.insert_after? then stack.insert_after  config.insert_after,  middleware, config
      else stack.insert_after Rack::Head, middleware, config
      end

      # set up sync middleware with I18n (rails uses this, amongst other things, for cache keys)
      stack.insert_after(middleware, Nii::I18n::Middleware, config)
    end
  end
end
