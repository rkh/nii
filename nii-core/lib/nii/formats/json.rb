# frozen_string_literal: true

module Nii::Formats
  class JSON
    # @api internal
    FORMATS = {
      default: [ :simple, :plain ],
      simple:  [ :simple, :plain ],
      i18n:    [ :i18n,   :ruby  ]
    }

    # @api internal
    DETECT = []

    # @api internal
    attr_reader :config, :structure, :message_format

    # @api internal
    def initialize(config)
      @config   = Nii::Config.new(config)
      format    = format_config&.format
      format    = format.to_sym        if format.respond_to? :to_sym
      format    = formats.values.first if formats.size == 1
      format  ||= :default             if structure = format_config&.structure
      format  ||= :default             if messages  = format_config&.messages
      
      if format and format != :detect
        @detect_format  = false
        format          = formats.fetch(format) { raise ArgumentError, "unsupported format: #{format.inspect}" } unless format.is_a? Array
        format[0]       = structure if structure
        format[1]       = messages  if messages
        format          = format.map { |e| e.respond_to?(:to_sym) ? e.to_sym : e }
        format          = build_format(*format)
        @structure      = format[0]
        @message_format = format[1]
      else
        @detect_format  = true
        @formats        = formats.transform_values { |f| build_format(*f) }
      end
    end

    # @api internal
    def compile(bundle, source)
      content = parse(source)

      if detect_format?
        structure, message_format = detect_format(bundle, content)
      else
        structure, message_format = self.structure, self.message_format
      end

      structure.process(content, bundle: bundle, message_format: message_format) do |key, message, **attributes|
        attributes.transform_values! { |value| compile_value(message_format, bundle, value) }
        message = Nii::Message.new(key, compile_value(message_format, bundle, message), **attributes)
        bundle.add(message)
      end
    end

    # @api internal
    def single_message? = false

    private

    def detect_format(bundle, content)
      format = detect_formats.detect { |s, m| format.detect?(bundle, content, m) }
      format || formats.fetch(:default)
    end

    def detect_formats
      @detect_formats ||= begin
        list = Array(format_config&.detect || self.class::DETECT)
        list.select! { |f| formats.include? f     }
        list.map!    { |f| formats.fetch(f)       }
        list.select! { |f| f.respond_to? :detect? }
        list
      end
    end

    def build_format(structure, messages)    = [Nii::Formats[Structure, structure], Nii::Formats[Messages, messages]]
    def detect_format?                       = @detect_format
    def formats                              = @formats        ||= self.class::FORMATS
    def format_config                        = config.json
    def parse(source)                        = Nii::Parser.json(source)
    def compile_value(format, bundle, value) = Nii::Template::Element === value ? value : format.compile(bundle, value)
  end
end
