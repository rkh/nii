# frozen_string_literal: true

module Nii
  module Lookup
    # @api internal
    LOADERS = {}

    autoload :Common,     'nii/lookup/common'
    autoload :Default,    'nii/lookup/default'
    autoload :FileCache,  'nii/lookup/file_cache'
    autoload :FileSystem, 'nii/lookup/file_system'
    autoload :I18n,       'nii/lookup/i18n'

    def self.[](key)
      require "nii/lookup/#{key}" unless LOADERS.include? key
      LOADERS.fetch(key)
    end

    def self.[]=(key, value)
      LOADERS[key] = value
    end

    def self.new(*arguments)
      return arguments.to_nii_lookup if arguments.first.respond_to? :to_nii_lookup
      config, paths = Config.extract(arguments)
      loader        = config.template_loader || :default
      loader        = self[loader] unless loader.respond_to? :new
      loader        = loader.new(config)
      loader.load_path.concat(paths)
      loader
    end
  end
end
