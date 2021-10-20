# frozen_string_literal: true

module Nii::Parser
  module Accept
    SIMPLE    = /^[a-zA-Z0-1_\-]+$/
    SEP       = /\s*,\s*/
    PARAM_SEP = /\s*;\s*/
    PARAMETER = /\Aq=([\d.]+)/
    extend self

    def parse(input)
      case input
      when nil, [], ''           then return []
      when Nii::Locale           then return [input]
      when Nii::LocalePreference then return input.locales
      when SIMPLE, Symbol        then return [Nii::Locale.parse(input)]
      when String                then return parse_accept(input)
      when Hash                  then return parse_accept(input['HTTP_ACCEPT_LANGUAGE']) if input.include? 'HTTP_ACCEPT_LANGUAGE'
      when Array                 then return input.flat_map { |e| parse(e) }
      end

      return parse(input.env) if input.respond_to? :env
      raise ArgumentError, "unable to parse locale: #{input.inspect}"
    rescue Nii::Errors::ParseError
      resolved = Nii::DATA.resolve_alias(input)
      return parse(resolved) if resolved != input
      raise
    end

    def parse_accept(input)
      list = input.split(SEP).map do |part|
        attribute, parameters = part.split(PARAM_SEP, 2)
        quality = parameters =~ PARAMETER ? $1.to_f : 1.0
        [attribute, quality]
      end

      list.sort_by! { |a, q| -q }
      list.map { |a, q| Nii::Locale.parse(a) }
    end
  end
end
