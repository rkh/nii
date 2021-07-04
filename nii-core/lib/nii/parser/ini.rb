# frozen_string_literal: true

%w[iniparse inifile].each do |library|
  require library
  break
rescue LoadError => error
  raise error unless error.path == library
end

module Nii::Parser
  module INI
    attr_accessor :backend
    extend self

    def parse(input)
      raise Nii::Errors::DependencyMissing, 'install iniparse or inifile for INI support' unless backend
      content   = backend.respond_to?(:parse) ? backend.parse(input) : backend.new(content: input, default: '__anonymous__')
      content   = content.to_h.dup
      anonymous = content.delete('__anonymous__').to_h
      anonymous.merge(content)
    end

    self.backend = ::IniParse if defined? ::IniParse
    self.backend = ::IniFile  if defined? ::IniFile
  end
end
