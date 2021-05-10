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

    def on_slim_output(escape, code, content)
      return [:slim, :output, false, "#{@context}.format(#{code}, escape_html: #{escape.inspect})", content] if code !~ IF_RE
      tmp     = unique_name
      capture = options[:disable_capture] ? compile(content) : [:capture, unique_name, compile(content)]
      [ :multi, [:slim, :control, "#{tmp} = #{code}", capture], on_slim_output(escape, tmp, []) ]
    end

    # make sure we don't run formatting for attribute values
    def on_html_attrs(*args)     = [:html, :attrs,    *args]
    def on_slim_attrvalue(*args) = [:slim, :attrvalue, *args]
  end
end
