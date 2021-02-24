# frozen_string_literal: true
require 'nii/core'
require 'nii/formats'
require 'nokogiri'

module Nii
  module XML
  end

  module Formats
    autoload :XML, 'nii/formats/xml'
  end
end
