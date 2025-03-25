# frozen_string_literal: true

module Nii::Formats::Structure
  class I18n
    MESSAGE_FORMAT = Nii::Formats::Messages::I18n
    PLURAL_KEYS    = %w[few many one other two zero]
    private_constant :MESSAGE_FORMAT, :PLURAL_KEYS

    # @api internal
    def self.process(content, **options, &block) = new(block, **options).load(content)

    # @api internal
    def self.detect?(bundle, content, message_format)
      return false if content.keys.size != 1
      locale = Nii::Locale.parse(content.keys.first)
      !!locale.language
    rescue Nii::Errors::ParseError
      false
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
      content.each do |locale, value|
        process(value) if bundle.locale.multiple_languages? or bundle.locale.subset_of? locale
      end
    end

    private

    attr_reader :callback, :bundle, :message_format, :separator

    def process(*key, value)
      # we silently ignore everything that's not a message
      # this way we can load Rails transation files that also include ActiveSupport configuration
      case value
      when String          then add(key, value)
      when Symbol, Numeric then add(key, Nii::Utils.string(value))
      when Array           then value.each_with_index { process(*key, _2, _1) }
      when Hash            then process_hash(key, value)
      end
    end
    
    def process_hash(key, hash)
      return if hash.empty?

      variants = hash.map do |subkey, value|
        subkey = subkey.name if subkey.is_a? Symbol
        process(*key, subkey, value)
        plural_variant(key.last, subkey, value)
      end.compact

      if variants.any?
        variable = Nii::Template::Variable.new(bundle, 'count', 0)
        template = Nii::Template::Select.new(bundle, variable, variants)
        add(key, template)
      end
    end

    def plural_variant(key, category, value)
      return unless value.is_a? String and PLURAL_KEYS.include? category
      category = [0, 'zero'] if category == 'zero'
      Nii::Template::Variant.new(bundle, category, prepare(key, value), default: category == 'other')
    end

    def prepare(subkey, value)
      return value if value.is_a? Nii::Template::Element
      value = Nii::Utils.string(value)
      value = Nii::HTML.safe(value) if subkey == 'html' or subkey.to_s.end_with? '_html'
      message_format.compile(bundle, value)
    end

    def add(key, value) = @callback.call(key.join(separator), prepare(key.last, value))
  end
end
