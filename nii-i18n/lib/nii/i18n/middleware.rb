# frozen_string_literal: true

module Nii::I18n
  # Middleware to inject after +Nii::Middleware+ (or some other middleware that sets a context) to enable synchronization.
  #
  # @example config.ru
  #   use Nii::Middleware
  #   use Nii::I18n::Middleware
  #
  #   run do |env|
  #     # I18n and Nii are synchronized while processing the request.
  #     I18n.locale = 'en-US'
  #     env['nii.context'].locale # => #<Nii::Locale:en-US>
  #
  #     # use env['nii.sync'] to temporarily disable synchronization
  #     env['nii.sync'].disable do
  #       I18n.locale = 'de-DE'
  #       env['nii.context'].locale # => #<Nii::Locale:en-US>
  #     end
  #
  #     # Rack compatible response
  #     [200, {}, ['ok']]
  #   end
  class Middleware
    # @param app [#call] Rack app to wrap.
    # @param config [Hash, Nii::Config]
    # @option config [String] env_key ("nii.context") Key to use for looking up the Nii::Context instance in the env hash.
    # @option config [String] sync_key ("nii.sync") Key to use for storing Nii::I18n::Synchronize instance in the env hash.
    #   Will default to "prefix.sync" if +env_key+ is set to "prefix.context".
    # @option config [true, false] complain (true) Whether or not to raise an exception if context is missing from the Rack env.
    def initialize(app, config = {})
      config    = Nii::Config.new(config)
      @env_key  = config.env_key  || 'nii.context'
      @sync_key = config.sync_key || @env_key =~ /^(.*)\.context$/ ? "#$1.sync" : 'nii.sync'
      @complain = config.complain.nil? ? true : config.complain?
      @app      = app
    end

    # Rack protocol.
    # @param env [Hash]
    # @return [Array<Integer, Hash{String => String}, #each>, Rack::Response] Rack response
    def call(env)
      if context = env[@env_key]
        sync = env[@sync_key] = Synchronization.new(context)
        sync.enable { @app.call(env) }
      elsif @complain
        raise RuntimeError, "#{@env_key} missing from Rack env"
      else
        @app.call(env)
      end
    end
  end
end
