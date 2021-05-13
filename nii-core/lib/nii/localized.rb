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

    def format(**options, &block) = @context.format(@object, **@options.merge(options), &block)
    alias_method :to_s, :format

    def localize(context = nil, **options)
      context ||= @context
      options   = options.any? ? @options.merge(options) : @options

      return self if context == @context and options == @options
      self.class.new(@object, context, **options)
    end

    alias_method :nii_localize, :localize

    # @api internal
    def format_options = @options

    private

    def respond_to_missing?(method, include_private = false) = @object.respond_to?(method)
    def method_missing(...) = @object.public_send(...)
  end
end
