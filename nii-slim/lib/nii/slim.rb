# frozen_string_literal: true
require 'nii/core'
require 'slim'

module Nii
  module Slim
    autoload :Filter, 'nii/slim/filter'
    autoload :Parser, 'nii/slim/parser'
    autoload :Scope,  'nii/slim/scope'
    autoload :Setup,  'nii/slim/setup'

    ::Slim::Engine.before  ::Slim::EndInserter, Filter
    ::Slim::Engine.replace ::Slim::Parser,      Parser

    Nii::Setup::Slim = Setup
  end
end
