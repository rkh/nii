# frozen_string_literal: true
require 'nii/core'
require 'nii/formats'
require 'nokogiri'

module Nii
  # Convenience method to load an XML document.
  # @return [Nii::XML::Document]
  def self.XML(source) = XML::Document.new(source)

  # Namespace for all XML document formats and APIs.
  module XML
    autoload :Document, 'nii/xml/document'
    autoload :Element,  'nii/xml/element'
    autoload :XLIFF,    'nii/xml/xliff'
  end

  # @api internal
  module Formats
    autoload :XLIFF, 'nii/formats/xliff'
    autoload :XML,   'nii/formats/xml'
  end
end
