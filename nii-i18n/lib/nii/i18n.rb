# frozen_string_literal: true
require 'nii/core'
require 'i18n'
require 'i18n/backend/fallbacks'

module Nii
  module I18n
    autoload :Backend,     'nii/i18n/backend'
    autoload :Fallbacks,   'nii/i18n/fallbacks'
    autoload :Middleware,  'nii/i18n/middleware'
    autoload :Setup,       'nii/i18n/setup'
    autoload :Synchronize, 'nii/i18n/synchronize'

    # @see Synchronize
    def self.synchronize(context, &block) = Synchronize.new(context).enable(&block)
  end

  # @api internal
  module Setup
    I18n = Nii::I18n::Setup
  end
end
