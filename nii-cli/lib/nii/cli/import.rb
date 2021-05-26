# frozen_string_literal: true

module Nii::CLI
  class Import < Command
    register 'import'
    argument :sources, type: :array, required: true
    option :structure, aliases: %w[-s], values: %w[nii i18n auto], default: 'auto'
    option :path, aliases: %w[-p], default: ENV['NII_PATH'] || 'locales'
    option :force, type: :boolean, aliases: %w[-f], default: false
  end
end
