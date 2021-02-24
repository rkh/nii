# frozen_string_literal: true

module Nii
  # Rack middleware for locale negotiation.
  class Middleware
    # @api internal
    attr_reader :app, :config, :negotiator

    # @note
    #   If you use a framework integration library, like nii-rails or nii-sinatra,
    #   it will set up the middleware for you by default.
    #
    # @overload initialize(app, config)
    #   @param app [#call] a Rack middleware or application
    #   @param config [Nii::Config, Hash, #to_nii_config]
    #
    #   @example
    #     use Nii::Middleware, available_locales: ["de", "en"]
    #
    # @overload initialize(app)
    #   @yield Setup block (DSL-style)
    #   @see Nii::Setup
    #
    #   @example
    #     use Nii::Middleware do
    #       language_header false
    #
    #       domain "example.com" do
    #         available_locales "en-US", "en-GB"
    #         locale_path
    #       end
    #
    #       domain "beispiel.de" do
    #         locale "de-DE"
    #       end
    #     edn
    #
    # @overload initialize(app)
    #   @yield [setup] Setup block (configuration style)
    #
    #   @example
    #     use Nii::Middelware do |config|
    #       config.language_header = false
    #
    #       config.domain "example.com" do |domain|
    #         domain.available_locales = "en-US", "en-GB"
    #         domain.locale_path       = true
    #       end
    #
    #       config.domain "beispiel.de" do |domain|
    #         domain.locale = "de-DE"
    #       end
    def initialize(app, config = nil, &block)
      @app = app

      if block
            @config = Nii.setup(&block).to_nii_config
            @config = @config.merge(config) if config
      elsif @config = Config[self.class]
            @config = @config.merge(config) if config
      else  @config = Config.new(config)
      end

      @negotiator = RackEnv.prepare(config)
    end

    # # @param env [Hash] Rack request env
    # # @return [Array] Rack response
    # # @see https://github.com/rack/rack/blob/master/SPEC.rdoc Rack Specification
    def call(env)
      return app.call(env) if negotiator.ignore? env['PATH_INFO']
      negotiation = negotiator.call(env)
      negotiator.process { app.call(negotiator.env) }
    end
  end
end
