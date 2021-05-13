# frozen_string_literal: true

module Nii
  # Namespace for all localization file formats.
  #
  # This is actually used to look up formats (unless overridden via configuration). Each class directly in this namespace
  # is assument to be a format implementation.
  #
  # @note
  #   Most of the format compilation API is considered internal at the moment (ie, not yet stable enough to be covered by semantic
  #   versioning - this should be ok though, as you as a user will not interact with this interface directly).
  module Formats
    autoload :Fluent,    'nii/formats/fluent'
    autoload :JSON,      'nii/formats/json'
    autoload :Messages,  'nii/formats/messages'
    autoload :PO,        'nii/formats/po'
    autoload :Ruby,      'nii/formats/ruby'
    autoload :Structure, 'nii/formats/structure'
    autoload :TXT,       'nii/formats/txt'
    autoload :YAML,      'nii/formats/yaml'

    def self.available
      @extensions ||= constants.inject({}) do |all, constant|
        next all unless implementation = const_get(constant) and implementation.respond_to? :new
        extensions   = implementation.const_get(:EXTENSIONS) if implementation.const_defined? :EXTENSIONS, false
        extensions ||= Array(Utils.string(constant.downcase))
        extensions.each { |e| all[e] = implementation }
        all
      end
    end

    # @return [Hash{String => Object}] maps file extensions to the corresponding format compiler
    def self.all(config = {})
      config = Config.new(config)
      available.transform_values { |f| f.new(config) }
    end

    # Convenience method for turning configuration options into constants.
    # @example
    #   Nii::Formats[:structure, :simple] # => Nii::Formats::Structure::Simple
    # @api internal
    def self.[](*keys)
      keys.inject(self) do |container, key|
        next key if key.respond_to? :const_get
        key      = Utils.string(key).gsub('_', '').downcase.to_sym
        constant = container.constants.detect { |c| c.downcase == key } || key.capitalize
        container.const_get(constant, false)
      end
    end
  end
end
