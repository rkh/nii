# frozen_string_literal: true

module Nii::Formats
  # Both Java .properties and Mozilla .properties
  class Properties
    # @api internal
    attr_reader :config, :message_format

    # @api internal
    def initialize(config)
      @config         = config
      @message_format = config.properties&.messages || :icu
    end

    # @api internal
    def compile(bundle, source, **options)
      Nii::Parser.properties(source).each do |key, value|
        template = message_format.compile(bundle, value)
        message  = Nii::Message.new(key, template)
        bundle.add(message, **options)
      end
    end
  end
end
