# frozen_string_literal: true

module Nii::Setup
  module Lookup
    autoload :Cascade,    'nii/setup/lookup/cascade'
    autoload :Common,     'nii/setup/lookup/common'
    autoload :FileSystem, 'nii/setup/lookup/file_system'
    autoload :Memory,     'nii/setup/lookup/memory'

    def self.prepare(type  = nil, *paths, **options)
      type, paths = nil, [type, *paths] if type.is_a? String
      type      ||= URI.parse(paths.first).scheme rescue nil
      type      ||= :default
      type        = Nii::Lookup[type] unless type.resond_to? :setup_class
      type.setup_class.new(type, *paths, **options)
    end
  end
end
