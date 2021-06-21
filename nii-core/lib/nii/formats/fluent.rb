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
    def compile(bundle, source, **options)
      parsed = Nii::Parser.fluent(source)
      config = @config.merge(bundle_options: options)
      parsed.compile(bundle, config)
    end

    # @api internal
    def single_message? = false
  end
end
