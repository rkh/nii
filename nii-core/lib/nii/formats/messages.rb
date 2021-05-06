# frozen_string_literal: true

module Nii::Formats
  # @api internal
  module Messages
    autoload :ARB,     'nii/formats/messages/arb'
    autoload :Detect,  'nii/formats/messages/detect'
    autoload :Plain,   'nii/formats/messages/plain'
    autoload :I18n,    'nii/formats/messages/i18n'
    autoload :ICU,     'nii/formats/messages/icu'
    autoload :Ruby,    'nii/formats/messages/ruby'
  end
end
