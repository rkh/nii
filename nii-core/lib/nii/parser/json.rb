# frozen_string_literal: true

module Nii::Parser
  module JSON
    attr_accessor :backend
    extend self

    def parse(input)
      backend.load(input)
    end

    begin
      require 'oj'
      self.backend = ::Oj
    rescue LoadError
      require 'json'
      self.backend = ::JSON
    end
  end
end
