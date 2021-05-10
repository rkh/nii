# frozen_string_literal: true
require 'nii/core'
require 'slim'

module Nii
  module Slim
    autoload :Filter, 'nii/slim/filter'
    autoload :Scope,  'nii/slim/scope'
    autoload :Setup,  'nii/slim/setup'

    ::Slim::Engine.before ::Slim::EndInserter, Filter
  end

  module Setup
    Slim = Nii::Slim::Setup
  end
end
