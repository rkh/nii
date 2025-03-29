# frozen_string_literal: true

module Nii::Rails
  # Setup scope for Rails applications and engines.
  class Setup < Nii::Setup::Vanilla
    include Nii::Setup::Shared::Routing

    # @api internal
    def self.for?(application)
      return false unless defined? ::Rails::Engine
      return application < ::Rails::Engine if application.is_a? Class
      application == ::Rails or application.is_a? ::Rails::Engine
    end

    # @api internal
    def initialize(application)
      application = application.application if application == ::Rails
      super
      set :reload_templates, Rails.env.development?
      @lookup.force_cascade!
      lookup(:default, Rails.root.join('app/locales'))
      lookup(:i18n, Rails.root.join('config/locales'))
    end

    # @api internal
    def finalize(finalized)
      finalized.config.lookup << Nii::I18n.lookup(finalized.config.except(:lookup))
      @application.config.nii = finalized.config
      finalize_middleware(finalized)
      finalize_i18n(finalized)
      Extension.install
    end

    def middleware(value = Nii::UNDEFINED) = set(:middleware, value, Nii::Middleware)

    private

    def default_config_path
      rails_path = Rails.configuration.paths['config'] || Rails.root.join('config')
      [ rails_path, '.' ]
    end

    def finalize_i18n(finalized)
      return if finalized[::I18n] # someone set it up explicitly
      unless I18n.config.available_locales_initialized?
        available_locales                     = finalized.config.available_locales&.map(&:code)
        available_locales                   ||= finalized.config.data.available_locales
        I18n.config.available_locales         = available_locales
        I18n.config.enforce_available_locales = false
      end
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
