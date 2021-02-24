# frozen_string_literal: true

module Nii
  # @api internal
  module Template
    autoload :AttributeReference, 'nii/template/attribute_reference'
    autoload :Concat,             'nii/template/concat'
    autoload :Element,            'nii/template/element'
    autoload :FunctionCall,       'nii/template/function_call'
    autoload :Lambda,             'nii/template/lambda'
    autoload :MessageReference,   'nii/template/message_reference'
    autoload :Select,             'nii/template/select'
    autoload :TermReference,      'nii/template/term_reference'
    autoload :Variable,           'nii/template/variable'
  end
end
