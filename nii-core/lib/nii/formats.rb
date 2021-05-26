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
    autoload :ARB,       'nii/formats/arb'
    autoload :Fluent,    'nii/formats/fluent'
    autoload :HJSON,     'nii/formats/hjson'
    autoload :HTML,      'nii/formats/html'
    autoload :JSON,      'nii/formats/json'
    autoload :Markdown,  'nii/formats/markdown'
    autoload :Messages,  'nii/formats/messages'
    autoload :PO,        'nii/formats/po'
    autoload :Ruby,      'nii/formats/ruby'
    autoload :Structure, 'nii/formats/structure'
    autoload :Textile,   'nii/formats/textile'
    autoload :TOML,      'nii/formats/toml'
    autoload :TXT,       'nii/formats/txt'
    autoload :YAML,      'nii/formats/yaml'


    def self.available
      @available ||= constants.map { const_get(_1) }.select { _1.respond_to? :new }
    end

    def self.extensions
      @extensions ||= available.inject({}) do |all, implementation|
        extensions   = implementation.const_get(:EXTENSIONS) if implementation.const_defined? :EXTENSIONS, false
        extensions ||= Array(Utils.type(implementation).to_s)
        extensions.each { |e| all[e] = implementation }
        all
      end
    end

    # @return [Hash{String => Object}] maps file extensions to the corresponding format compiler
    def self.all(config = {})
      config = Config.new(config)
      extensions.transform_values { |f| f.new(config) }
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
