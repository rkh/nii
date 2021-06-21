# frozen_string_literal: true

module Nii::Formats
  class TXT
    # @api internal
    attr_reader :config

    # @api internal
    def initialize(config = nil) = @config = Nii::Config.new(config)
    
    # @api internal
    def compile(bundle, source, name:, **options)
      message = Nii::Message.new(name, compile_template(bundle, source))
      bundle.add(message, **options)
    end

    # @api internal
    def compile_template(bundle, source) = Nii::Template::Element.new(bundle, source)

    # @api internal
    def single_message? = true
  end
end
