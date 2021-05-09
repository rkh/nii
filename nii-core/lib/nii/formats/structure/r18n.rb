# frozen_string_literal: true

module Nii::Formats::Structure
  class R18n
    MESSAGE_FORMAT = Nii::Formats::Messages::R18n
    TAGS           = %w[pl escape html markdown textile]
    private_constant :MESSAGE_FORMAT, :TAGS

    # @api internal
    def self.process(content, **options, &block) = new(block, **options).load(content)

    # @api internal
    def self.detect?(bundle, content, message_format)
      return false unless content.respond_to? :yaml_tags
      content.yaml_tags.any? and content.yaml_tags.all? { TAGS.include? _1 }
    end

    # @api internal
    def initialize(callback, bundle:, message_format: MESSAGE_FORMAT, separator: '.', **)
      @callback       = callback
      @bundle         = bundle
      @message_format = message_format
      @separator      = separator
    end

    # @api internal
    def load(content)
      process(content) do |key, value|
        key   = Array(key).flatten.join(separator)
        value = Nii::Utils.string(value) unless value.is_a? Nii::Tempalte::Element
        @callback.call key, value
      end
    end

    private

    def process(*key, content, &block)
      if content.respond_to? :yaml_tag and tag = content.yaml_tag?
        Nii::Errors::CompileError, "unknown R18n YAML tag: #{tag.inspect}" unless TAGS.include? tag
        content = send(tag, content)
      end

      case content
      when Hash  then value.each { process(*key, _1, _2, &block) }
      when Array then value.each_with_index { process(*key, _2, _1, &block) }
      else yield key, content
      end
    end

    def escape(content)   = Nii::HTML.escape(content)
    def html(content)     = Nii::HTML.safe(content)
    def markdown(content) = Nii::Formats::Markdown.new.compile_template(bundle, content)
    def textile(content)  = Nii::Formats::Textile.new.compile_template(bundle, content)

    def pl(content)
      variable = Nii::Template::Variable.new(bundle, 0, 0)
      variable = Nii::Template::Variable.new(bundle, 'count', variable)
      variants = []
      process(content) do |key, value|
        key   = 'other' if key == 'n'
        value = format.compile(value) unless value.is_a? Nii::Template::Element
        variants << Nii::Template::Variant.new(bundle, key, value, default: key == 'other')
      end
      Nii::Template::Select.new(bundle, variable, variants)
    end
  end
end
