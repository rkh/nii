# frozen_string_literal: true

module Nii::Formats
  class Ruby < JSON
    # @api internal
    EXTENSIONS = %w[] # disabled by default
    FORMATS    = { default: JSON::FORMATS[:i18n] }

    private
    def format_config = config.ruby
    def parse(source, **options) = eval(source, TOPLEVEL_BINDING, options[:source] || '(nii)')
  end
end
