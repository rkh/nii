# frozen_string_literal: true

module Nii::Setup::Lookup
  class Common
    include Nii::Setup::Shared::Config, Nii::Setup::Shared::Locales

    # @api internal
    def initialize(type, *sources, **options)
      super
      @type     = type
      @sources  = sources
      @callback = nil
      yield self if block_given?
    end

    # @api internal
    def <<(value) = @sources << value

    # @api internal
    def _build(config)
      config = Nii::Config.new(config.except(:lookup).merge(@config))
      lookup = @type.new(config, &@callback)
      add_sources(lookup)
      lookup
    end

    # @api setup
    #
    # Enables automatic message template reloading whenever localization files change.
    # Framework integrations like nii-rails and nii-sinatra will typically set this
    # option for you in development mode.
    #
    # @default false
    def reload_templates(value = true) = set(:reload_templates, value)

    private

    def add_sources(lookup) = @sources.each { lookup << _1 }
  end
end
