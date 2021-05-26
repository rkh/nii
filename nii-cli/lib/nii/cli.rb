# frozen_string_literal: true
require 'nii/core'
require 'dry/cli'

module Nii::CLI
  extend Dry::CLI::Registry
  def self.run(...) = Dry::CLI.new(self).call(...)

  NII_CONFIG = Nii["#{__dir__}/../../locales", escape_html: false]
  NII_LOCALE = 'en'
  private_constant :NII_CONFIG, :NII_LOCALE
end

# load all ruby files in cli/
require 'nii/cli/command'
Dir.glob("#{File.expand_path(__dir__)}/cli/**/*.rb").sort.each { require _1 }
