# frozen_string_literal: true
require 'nii/core'
require 'nii/i18n'

module Nii
  module Rails
    autoload :Setup, 'nii/rails/setup'
    def self.setup(app = ::Rails.application, &block) = Setup.setup(app, &block)
  end

  module Setup
    Rails = Nii::Rails::Setup
  end
end
