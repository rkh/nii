# frozen_string_literal: true

module Nii
  class Localized
    def self.localize(method, wrapper = nil, **options)
      define_method(method) do |*a, **o, &b|
        result = @object.public_send(*a, **o, &b)
        wrapper ? wrapper.new(result, @context, **options) : @context.localize(result, **options)
      end
    end

    # @api internal
    attr_accessor :_localized

    # @api internal
    def initialize(object, context, localized = nil, **options)
      @object    = object
      @context   = context
      @localized = localized
      @options   = options
    end

    def format(**options, &block) = @localized || @context.format(@object, **@options.merge(options), &block)
    alias_method :to_s, :format

    def localize(context = nil, **options)
      context = context ? Context.new(context) : @context
      options = options.any? ? @options.merge(options) : @options

      return self if context == @context and options == @options
      self.class.new(@object, context, @localized, **options)
    end

    alias_method :nii_localize, :localize

    # @api internal
    def format_options = @options
    
    # @api internal
    def nii_attribute?(name)
      return @object.respond_to?(name)   unless @object.is_a? Hash
      return nii_attribute?(name.to_sym) unless name.is_a? Symbol
      @object.include? name or @object.include? name.name
    end
    
    # @api internal
    def nii_attribute(name)
      return @object.public_send(name)  unless @object.is_a? Hash
      return nii_attribute(name.to_sym) unless name.is_a? Symbol
      @object.fetch(name) { @object.fetch(name.name) }
    end

    private

    def respond_to_missing?(method, include_private = false) = @object.respond_to?(method)
    def method_missing(...) = @object.public_send(...)
  end
end
