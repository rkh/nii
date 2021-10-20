# frozen_string_literal: true

module Nii::Setup::Shared
  module Load
    # @api setup
    #
    # Loads Nii configuration from an external file.
    # Supports globbing.
    #
    # @example
    #   Nii::Setup.new do
    #     # load config from nii.yml
    #     load "nii.yml"
    #
    #     # load config from yaml, json, and toml files
    #     # from the config/nii directory
    #     load "*.yml", "*.json", "*.toml", path: "config/nii"
    #   end
    #
    #   # shorthand
    #   Nii::Setup.load "nii.yml"
    def load(*files, path: nil, glob: nil, format: nil)
      path ||= config_path
      path   = Nii::LoadPath.new(path) unless path.is_a? Nii::LoadPath
      files  = files.flat_map { glob?(glob, file) ? path.glob(file) : path.lookup(file) }
      files.each { apply Nii::Parser.load(_1, format: format) }
    end

    # @api setup
    #
    # Configures the load path to use for {#load}. Default depends on the framework context
    # (Rails config directory for Rails, current directory for a vanilla setup, etc).
    #
    # @example
    #   Nii::Setup.new do
    #     # load nii config files from config/i18n and config/nii
    #     config_path "config/i18n", "config/nii"
    #
    #     load "all.yml"
    #     on("en") { load "english.yml" }
    #     on("de") { load "german.yml" }
    #   end
    def config_path(*paths)
      @config_path   = Nii::LoadPath.new(paths) if paths.any?
      @config_path ||= Nii::LoadPath.new(default_config_path)
    end

    private

    def apply(data, target: self, allow_condition: nil)
      allow_condition = true if allow_condition.nil? and target.is_a? Conditional
      data.each_pair do |key, value|
        next apply(value, target: target, allow_condition: allow_condition) unless key &&= Nii::Utils.string(key)
        next apply(value, target: target.on(key)) if allow_condition and not target.respond_to? key
        next target.public_send(key, value) unless value.is_a? Hash
        map = key == 'on' ? value : { key => value }
        map.each_pair { apply(_2, target: target.public_send(_1), allow_condition: false) }
      end
    end

    def glob?(glob, input) = glob.nil? ? input.is_a?(String) : glob

    # can be overridden by framework integrations to point to the right path
    def default_config_path = '.'
  end
end
