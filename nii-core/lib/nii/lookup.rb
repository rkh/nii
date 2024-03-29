# frozen_string_literal: true

module Nii
  module Lookup
    # @api internal
    LOADERS = {}

    autoload :Cascade,    'nii/lookup/cascade'
    autoload :Common,     'nii/lookup/common'
    autoload :Default,    'nii/lookup/default'
    autoload :FileCache,  'nii/lookup/file_cache'
    autoload :FileSystem, 'nii/lookup/file_system'
    autoload :I18n,       'nii/lookup/i18n'
    autoload :Memory,     'nii/lookup/memory'

    def self.[](key)
      require "nii/lookup/#{key}" unless LOADERS.include? key
      LOADERS.fetch(key.to_sym)
    end

    def self.[]=(key, value)
      LOADERS[key] = value
    end

    def self.new(*arguments, &block)
      return arguments.to_nii_lookup if arguments.first.respond_to? :to_nii_lookup
      config, paths = Config.extract(arguments)
      loader        = config.template_loader || :default
      loader        = self[loader] unless loader.respond_to? :new
      loader        = loader.new(config, &block)
      loader.load_path.concat(paths) if paths.any?
      loader
    end
  end
end
