# frozen_string_literal: true

module Nii::Formats::Structure
  module I18n
    extend self

    def process(content, bundle:, message_format: Nii::Formats::Messages::Ruby, **, &block)
      content = content.fetch(bundle.locale.to_s) { raise Nii::Errors::CompileError, "missing key: #{bundle.locale}" }
      process_entry(content, message_format, &block)
    end

    def detect?(bundle, content, message_format)
      return false if content.keys.size != 1
      locale = Nii::Locale.parse(content.keys.first)
      locale.superset_of? bundle.locale
    rescue Nii::Errors::ParseError
      false
    end

    private

    def process_entry(content, message_format, &block)
      raise NotImplementedError
    end
  end
end
