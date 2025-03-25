# frozen_string_literal: true
require 'i18n'

module Nii::I18n
  module Config
    # @api internal
    def load_path
      @@_load_path ||= ArrayMonitor.new(super)
    end

    # @api internal
    def load_path=(value)
      @@_load_path = @@_load_path.replace(value)
      super
    end
  end
end
