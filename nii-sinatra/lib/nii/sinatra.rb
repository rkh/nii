# frozen_string_literal: true
require 'nii/core'
require 'sinatra/base'

module Nii
  module Sinatra
    autoload :Setup, 'nii/sinatra/setup'

    def self.registered(base)
      base.register(Extension) unless base.is_a? Extension
    end
  end

  module Setup
    Sinatra = Nii::Sinatra::Setup
  end
end
