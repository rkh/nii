# frozen_string_literal: true

module Nii
  class Localized
    def self.localize(method, wrapper = nil, **options)
      define_method(method) do |*a, **o, &b|
        result = @object.public_send(*a, **o, &b)
        wrapper ? wrapper.new(result, @context, **options) : @context.localize(result, **options)
      end
    end

    def initialize(object, context, **options)
      @object  = object
      @context = Context.new(context)
      @options = options
    end

    def format(**options) = @context.format(@object, **@options.merge(options))
    alias_method :to_s, :format

    def localize(context = nil, **options)
      context ||= @context
      options   = @options.merge(options)

      return self if context == @context and options == @options
      self.class.new(@object, context, **options)
    end

    alias_method :nii_localize, :localize

    private

    def __localize__?(method, value)
      return false if method.start_with? '_'
      context.localize? value
    end

    def respond_to_missing?(method, include_private = false) = @object.respond_to?(method)

    def method_missing(method, ...)
      result = @object.public_send(method, ...)
      result = @context.localize(result) if __localize__? method, result
      result
    end
  end
end
