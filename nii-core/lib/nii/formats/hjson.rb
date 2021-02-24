# frozen_string_literal: true

begin
  require 'hjson'
rescue LoadError => error
  raise error unless error.path == 'hjson'
end

module Nii::Formats
  class HJSON < JSON
    # @api internal
    EXTENSIONS = %w[hjson]

    private
    def format_config = config.toml
    def parse(source)
      return Hjson.parse(source) if defined? Hjson
      raise Nii::Errors::DependencyMissing, 'install hjson for toml support'
    end
  end
end
