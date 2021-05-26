# frozen_string_literal: true

module Nii::Formats::Messages
  class Ruby
    PATTERN = /%(?:<(.+)>|{(.+)}|([^<{]))/
    SIMPLE  = /%\{\s*([a-z]\w*)\s*\}/
    COMPLEX = /(?!#{SIMPLE})#{PATTERN}/

    def self.compile(bundle, source)
      if source =~ COMPLEX
        instance    = new(source)
        node        = Nii::Template::Lambda.new(bundle) { |c, v, &b| source % instance.payload(c, v, &b) }
        count       = -1
        node.fluent = source.gsub(PATTERN) { "{ $#{$1 || $2 || "v#{count += 1}"} }" }
        node
      elsif source =~ SIMPLE
        scanner = StringScanner.new(source)
        payload = []
        last    = 0
        while scanner.scan_until(SIMPLE)
          payload << Nii::Template::Element.new(bundle, scanner.pre_match[last..-1])
          payload << Nii::Template::Variable.new(bundle, scanner[1])
          last = scanner.pos
        end
        payload << Nii::Template::Element.new(bundle, scanner.rest)
        Nii::Template::Concat.new(bundle, payload)
      else
        Plain.compile(bundle, source)
      end
    end

    attr_reader :type, :keys

    def initialize(source)
      source.scan(PATTERN) do |key1, key2, positional|
        if key = key1 || key2
          self.type = :hash
          @keys ||= []
          @keys << key.to_sym
        elsif positional != '%'
          self.type = :array
          @keys ||= 0
          @keys += 1
        end
      end
    end

    def type=(value)
      @type ||= value
      raise Nii::Errors::ParseError, 'cannot combine named and unnumbered arguments' if @type != value
    end

    def get(context, variables, key, &block)
      variable = context.normalize_variable_name(key)
      result   = variables.fetch(variable) { context.unknown_variable(variable, variables) }
      context.format_variable!(variable, result, &block)
    end

    def payload(context, variables, &block)
      return keys.times.map { |key| get(context, variables, key) } if type == :array
      keys.map { |key| [key, get(context, variables, key, &block)] }.to_h
    end
  end
end
