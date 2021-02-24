# frozen_string_literal: true

module Nii::Formats
  # @api internal
  module Messages
    autoload :Detect,  'nii/formats/messages/detect'
    autoload :Plain,   'nii/formats/messages/plain'
    autoload :Ruby,    'nii/formats/messages/ruby'
  end
end
