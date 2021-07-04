# frozen_string_literal: true

begin
  require 'hjson'
rescue LoadError => error
  raise error unless error.path == 'hjson'
end

module Nii::Parser
  module HJSON
    extend self

    def parse(input)
      return Hjson.parse(input) if defined? Hjson
      raise Nii::Errors::DependencyMissing, 'install hjson for HJSON support'
    end
  end
end

