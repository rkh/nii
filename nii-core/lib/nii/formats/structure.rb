# frozen_string_literal: true

module Nii::Formats
  # @api internal
  module Structure
    autoload :ARB,    'nii/formats/structure/arb'
    autoload :I18n,   'nii/formats/structure/i18n'
    autoload :R18n,   'nii/formats/structure/r18n'
    autoload :Simple, 'nii/formats/structure/simple'
  end
end
