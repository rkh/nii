# frozen_string_literal: true
require 'nii/core'
require 'nii/shared'

module Nii
  Global = Shared.new

  module Setup
    autoload :Global, 'nii/setup/global'
  end
end
