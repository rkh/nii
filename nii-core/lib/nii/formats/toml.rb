# frozen_string_literal: true

%w[tomlrb toml-rb toml].each do |library|
  require library
  break
rescue LoadError => error
  raise error unless error.path == library
end

module Nii::Formats
  class TOML < JSON
    # @api internal
    EXTENSIONS = %w[toml]

    private
    def format_config = config.toml
    def parse(source)
      return ::Tomlrb.parse(source) if defined? ::Tomlrb
      return ::TomlRB.parse(source) if defined? ::TomlRB
      return ::TOML.load(source)    if defined? ::TOML
      raise Nii::Errors::DependencyMissing, 'install tomlrb for toml support'
    end
  end
end
