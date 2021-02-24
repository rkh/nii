# frozen_string_literal: true

module Nii::Formats
  class PO
    # @api internal
    FORMATS = {
      'c'       => Messages::Ruby,
      'default' => Messages::Ruby,
      'ruby'    => Messages::Ruby,
    }

    # @api internal
    attr_reader :config

    # @api internal
    def initialize(config) = @config = config

    # @api internal
    def single_message? = false

    # @api internal
    def compile(bundle, source)
      Nii::Parser.gettext(source).each do |message|
        flags, msgid, msgstr, msgid_plural = [], nil, nil, nil

        message.each_pair do |key, value|
          case key
          when 'flags'        then flags        = value
          when 'msgid'        then msgid        = value
          when 'msgstr'       then msgstr       = value
          when 'msgid_plural' then msgid_plural = value
          when /^msgstr\[(\d+)\]$/
            msgstr = [] unless msgstr.is_a? Array
            msgstr[Integer($1)] = value
          else raise Nii::Errors::CompileError, "unexpected keyword: #{key}"
          end
        end

        message_format = message_format(*flags)
        raise NotImplementedError, 'TODO: plural support' if msgid_plural
        raise NotImplementedError, 'missing msgid'  unless msgid.is_a? String
        raise NotImplementedError, 'missing msgstr' unless msgstr.is_a? String

        template = message_format.compile(bundle, msgstr)
        bundle.add Nii::Message.new(msgid, template)
      end
    end

    private
  
    def message_format(*flags)
      format, fallback = nil, FORMATS.fetch('default')
      flags.each do |flag|
        case flag
        when /^no-(.+)-format$/ then fallback = Messages::Plain
        when /^(.+)-format$/    then format   = FORMATS[$1] || format
        end
      end
      format || fallback
    end
  end
end
