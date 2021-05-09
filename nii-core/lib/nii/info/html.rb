# frozen_string_literal: true

module Nii::Info
  # This will be exposed as {Nii::Context#html}.
  # @see Nii::Context#method_missing
  class Html < Generic
    PATTERN   = /\{(\d+)\}/
    ESCAPE    = { "'" => "&#39;", "&" => "&amp;", "\"" => "&quot;", "<" => "&lt;", ">" => "&gt;" }
    MATCH     = %r{(?!#{Regexp.union(ESCAPE.values)})#{Regexp.union(ESCAPE.keys)}}
    HTML_TAG  = %r{</?(?<tag>\w+)/?>}
    TEXT_TAGS = %w[bdi br cite code em kbd mark q s samp small strong sub sup time var wbr]
    private_constant :PATTERN, :ESCAPE, :MATCH, :HTML_TAG

    # Safely inserts arbitrary strings (like user input) into a simple HTML template.
    # If ActiveSupport is loaded, the resulting string will also be marked as HTML safe.
    #
    # @example HTML safe insertion
    #   context = Nii::Context.new
    #   context.html "<b>?</b>", "a > b" # => "<b>a &gt; b</b>"
    #
    # @return [String, ActiveSupport::SafeBuffer, Nii::HTMLString] the string, marked html safe
    def insert(template, *values, **options)
      if values.any?
        values = values.map { |v| format(v, **options) }
        result = template.gsub('?').with_index { |_, i| values[i] }
        result.gsub!(PATTERN) { values[$1.to_i] }
      end
      safe(result || template)
    end

    # @api internal
    alias_method :[], :insert

    # Escapes most HTML with the exception of certain text-level semantic tags that are commonly
    # required for properly formatting translations.
    #
    # @example
    #   context = Nii::Context.new
    #   context.html.format "1<sup>st</sup> > 2<sup>nd</sup>"
    #
    # Tags with attributes will not be accepted.
    # If an HTML safe string is passed, it will return it unmodifier.
    def format(string, allowed_tags: TEXT_TAGS, encoding: context.encoding, **options)
      return string if string.respond_to? :html_safe? and string.html_safe?
      return string if options[:escape_html] == false
      escape_with(string, encoding) do |source|
        result = String.new
        source = StringScanner.new Nii::Utils.string(string)
        until source.eos?
          if source.scan(HTML_TAG)
            if TEXT_TAGS.include? source[:tag].downcase
              result << source.matched
              next
            end
            source.unscan
          end
          element = source.scan(MATCH) ? ESCAPE.fetch(source.matched) : source.getch
          result << element
        end
        result
      end
    end

    # Escapes HTML entities in the given string.
    # Strings are only escaped once, known escape entries will not be escaped again.
    #
    # @example Escaping HTML
    #   html = Nii::Context.new.html
    #   html.escape "&" # => "&amp;"
    #
    #   # this method won't double escape
    #   html.escape "&amp;" # => "&amp;"
    #
    #   # therefore this should always be true
    #   html.escape(string) == html.escape(html.escape(string))
    #
    # @return [String] escaped string
    def escape(string, encoding: context.encoding) = escape_with(string, encoding) { |s| s.gsub(MATCH) { |c| ESCAPE.fetch(c) } }

    # Will call #html_safe on the given object, if available, otherwise create a {Nii::HTMLString}.
    # @param input [#html_safe, #to_str]
    # @return [Nii::HTMLString, ActiveSupport::SafeBuffer] the string, possibly marked html safe
    def safe(input) = input.respond_to?(:html_safe) ? input.html_safe : Nii::HTMLString.new(input.to_str)

    # @note This will always return false if ActiveSupport (or another library definen +html_safe?+) hasn't been loaded.
    # @return [true, false] whether the argument has been marked as html safe or not
    def safe?(string)
      return false unless string.respond_to? :html_safe?
      string.html_safe?
    end

    private

    def escape_with(string, encoding, &block)
      string = Nii::Utils.string(string)
      unless string.encoding.ascii_compatible?
        intermediate = encoding.ascii_compatible? ? encoding : Encoding::Converter.asciicompat_encoding(encoding)
        string = string.encode(intermediate || 'binary')
      end
      string = yield(string)
      string = string.encode(encoding) if string.encoding != encoding
      safe(string)
    end
  end
end
