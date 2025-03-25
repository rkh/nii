# frozen_string_literal: true
require 'nii/core'
require 'i18n'
require 'i18n/backend/fallbacks'

module Nii
  module I18n
    autoload :ArrayMonitor, 'nii/i18n/array_monitor'
    autoload :Backend,      'nii/i18n/backend'
    autoload :Config,       'nii/i18n/config'
    autoload :Fallbacks,    'nii/i18n/fallbacks'
    autoload :Middleware,   'nii/i18n/middleware'
    autoload :Setup,        'nii/i18n/setup'
    autoload :Synchronize,  'nii/i18n/synchronize'

    # @see Synchronize
    def self.synchronize(context, &block) = Synchronize.new(context).enable(&block)

    # Calls the given block for each current load path and all load paths added in the future.
    #
    # @yieldparam path [String] a load path
    # @return [void]
    def self.monitor_paths(&block)
      config = ::I18n::Config.new
      config.load_path = ArrayMonitor.new(config.load_path) unless config.load_path.is_a?(ArrayMonitor)
      config.load_path.callback(&block)
    end

    # A locale lookup that stays synced with I18n.load_path.
    #
    # @return [Nii::Lookup::I18n]
    # @config [Nii::Config] config
    def self.lookup(config)
      lookup = Nii::Lookup::I18n.new(config)
      monitor_paths { |path| lookup << path }
      lookup
    end
  end

  # @api internal
  module Setup
    I18n = Nii::I18n::Setup
  end
end

I18n::Config.prepend Nii::I18n::Config
