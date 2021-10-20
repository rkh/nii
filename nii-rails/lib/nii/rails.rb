# frozen_string_literal: true
require 'nii/core'
require 'nii/i18n'

module Nii
  module Rails
    autoload :Setup,     'nii/rails/setup'
    autoload :Extension, 'nii/rails/extension'
    autoload :Types,     'nii/rails/types'
    def self.setup(app = ::Rails.application, &block) = Setup.setup(app, &block)
  end

  module Setup
    Rails = Nii::Rails::Setup
  end
end
