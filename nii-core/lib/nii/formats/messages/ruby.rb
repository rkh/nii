# frozen_string_literal: true

module Nii::Formats::Messages
  class Ruby
    PATTERN = /%(?:<(.+)>|{(.+)}|([^<{]))/

    def self.compile(bundle, source)
      return Plain.compile(bundle, source) unless instance = new(source) and instance.type
      Nii::Template::Lambda.new(bundle) { |c, v, &b| source % instance.payload(c, v, &b) }
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
