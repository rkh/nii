# frozen_string_literal: true

module Nii::Formats
  # @api internal
  module Messages
    autoload :ARB,      'nii/formats/messages/arb'
    autoload :Flexible, 'nii/formats/messages/flexible'
    autoload :I18n,     'nii/formats/messages/i18n'
    autoload :ICU,      'nii/formats/messages/icu'
    autoload :Plain,    'nii/formats/messages/plain'
    autoload :R18n,     'nii/formats/messages/r18n'
    autoload :Ruby,     'nii/formats/messages/ruby'
  end
end
