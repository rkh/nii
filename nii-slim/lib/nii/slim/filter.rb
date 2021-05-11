# frozen_string_literal: true

module Nii::Slim
  # @api internal
  class Filter < ::Slim::Filter
    IF_RE = ::Slim::Controls::IF_RE
    private_constant :IF_RE

    def call(exp)
      @context = unique_name
      [:multi, [:code, "#{@context} = Nii::Slim::Scope.new(self, binding)"], super]
    end

    def on_nii(message, content)
      message = message.strip
      namespace, message, options = parse_message(message)
      call = "#{@context}.translate #{namespace.inspect}, #{message.inspect}, binding"
      call << ", #{options}" if options
      call << " do" if content? content
      [ :slim, :output, false, call, content]
    end

    def on_slim_output(escape, code, content)
      return [:slim, :output, false, "#{@context}.format(#{code}, escape_html: #{escape.inspect})", content] if code !~ IF_RE
      tmp     = unique_name
      capture = options[:disable_capture] ? compile(content) : [:capture, unique_name, compile(content)]
      [ :multi, [:slim, :control, "#{tmp} = #{code}", capture], on_slim_output(escape, tmp, []) ]
    end

    # make sure we don't run formatting for attribute values
    def on_html_attrs(*args)     = [:html, :attrs,    *args]
    def on_slim_attrvalue(*args) = [:slim, :attrvalue, *args]

    private

    def parse_message(source)
      return nil, source, nil unless /\A((?<namespace>[^:\s]*)::)?(?<message>[^\(]+)(:?\((?<options>.*)\))?(?:\s*do)?\Z/ =~ source
      options   = nil if options =~ /\A\s*\Z/
      namespace = nil if namespace =~ /\A\s*\Z/
      return namespace, message, options
    end

    def content?(content)
      case content
      in [:multi, *nested] then nested.any? { content? _1 }
      in [:slim, *]        then true
      else false
      end
    end
  end
end
