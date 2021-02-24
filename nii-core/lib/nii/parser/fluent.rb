# frozen_string_literal: true
module Nii::Parser
  module Fluent
    autoload :Arguments,    'nii/parser/fluent/arguments'
    autoload :Attribute,    'nii/parser/fluent/attribute'
    autoload :Blank,        'nii/parser/fluent/blank'
    autoload :Comment,      'nii/parser/fluent/comment'
    autoload :Expression,   'nii/parser/fluent/expression'
    autoload :Function,     'nii/parser/fluent/function'
    autoload :Generic,      'nii/parser/fluent/generic'
    autoload :Junk,         'nii/parser/fluent/junk'
    autoload :MessageEntry, 'nii/parser/fluent/message_entry'
    autoload :Message,      'nii/parser/fluent/message'
    autoload :Named,        'nii/parser/fluent/named'
    autoload :Number,       'nii/parser/fluent/number'
    autoload :Pattern,      'nii/parser/fluent/pattern'
    autoload :Placeable,    'nii/parser/fluent/placeable'
    autoload :Reference,    'nii/parser/fluent/reference'
    autoload :Resource,     'nii/parser/fluent/resource'
    autoload :Select,       'nii/parser/fluent/select'
    autoload :Scanner,      'nii/parser/fluent/scanner'
    autoload :String,       'nii/parser/fluent/string'
    autoload :Term,         'nii/parser/fluent/term'
    autoload :Text,         'nii/parser/fluent/text'
    autoload :Variant,      'nii/parser/fluent/variant'

    def self.parse(source, **options)
      Scanner.new(source, **options).to_ast
    end

    def self.[](key)
      const_get(key.capitalize)
    end
  end
end
