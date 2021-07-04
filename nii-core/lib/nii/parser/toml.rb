# frozen_string_literal: true

%w[tomlrb toml-rb toml].each do |library|
  require library
  break
rescue LoadError => error
  raise error unless error.path == library
end

module Nii::Parser
  module TOML
    attr_accessor :backend
    extend self

    def parse(input)
      return backend.load(input)  if backend.respond_to? :load
      return backend.parse(input) if backend.respond_to? :parse
      raise Nii::Errors::DependencyMissing, 'install tomlrb for toml support'
    end

    self.backend = ::Tomlrb if defined? ::Tomlrb
    self.backend = ::TomlRB if defined? ::TomlRB
    self.backend = ::Toml   if defined? ::Toml
  end
end
