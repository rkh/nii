# frozen_string_literal: true

module Nii::Formats
  class Fluent
    # @api internal
    EXTENSIONS = %w[ftl fluent]

    # @api internal
    attr_reader :config

    # @api internal
    def initialize(config)= @config = config

    # @api internal
    def compile(bundle, source) = Nii::Parser.fluent(source).compile(bundle, config)

    # @api internal
    def single_message? = false
  end
end
