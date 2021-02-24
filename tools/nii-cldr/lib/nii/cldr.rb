# frozen_string_literal: true
require 'pathname'
require 'json'
require 'neatjson'
require 'nii/core'
require 'zlib'
require 'progressbar'
require 'nokogiri'

module Nii
  module CLDR
    autoload :Locale,     'nii/cldr/locale'
    autoload :Repository, 'nii/cldr/repository'
    autoload :Store,      'nii/cldr/store'
    autoload :Timezones,  'nii/cldr/timezones'
    autoload :Transforms, 'nii/cldr/transforms'
  end
end
