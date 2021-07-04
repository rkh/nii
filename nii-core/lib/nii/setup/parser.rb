# frozen_string_literal: true

module Nii::Setup
  # Setup scope for Nii::Middleware.
  module Parser
    extend self

    # @api setup
    #
    # Sets which library to use for parsing JSON.
    # Object this is set to only needs to implement +load+.
    #
    # If not set explicitely, Nii will pick-up Oj if available,
    # and use Ruby's built-in JSON implementation otherwise.
    #
    # @example
    #   Nii::Setup.new do
    #     parser.json = MultiJson
    #   end
    def json(value = nil) = set_backend(Nii::Parser::JSON, value)
  
    # @api setup
    #
    # Sets which library to use for parsing TOML.
    # Object this is set to only needs to implement +load+ or +parse+.
    #
    # If not set explicitely, Nii will attempt to use tomlrb, toml-rb, or toml
    # (in that order).
    #
    # @example
    #   Nii::Setup.new do
    #     parser.toml = TomlRB
    #   end
    def toml(value = nil) = set_backend(Nii::Parser::TOML, value)
  
    # @api setup
    #
    # Sets which library to use for parsing INI files.
    # Object this is set to only needs to implement +parse+,or have a constructor compatible with +IniFile+.
    #
    # If not set explicitely, Nii will attempt to use iniparse or inifile.
    #
    # @example
    #   Nii::Setup.new do
    #     parser do
    #       json Yajl
    #       toml TomlRB
    #       ini  IniFile
    #     end
    #   end
    def ini(value = nil) = set_backend(Nii::Parser::INI, value)

    private

    def set_backend(parser, value)
      parser.backend = value if value
      parser.backend
    end
  end
end
