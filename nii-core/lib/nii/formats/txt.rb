# frozen_string_literal: true

module Nii::Formats
  class TXT
    # @api internal
    attr_reader :config

    # @api internal
    def initialize(config) = @config = config
    
    # @api internal
    def compile(bundle, source, name:) = bundle.add(Nii::Message.new(name, compile_template(bundle, source)))

    # @api internal
    def compile_template(bundle, source) = Nii::Template::Element.new(bundle, source)

    # @api internal
    def single_message? = true
  end
end
