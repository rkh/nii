# frozen_string_literal: true

module Nii::Setup
  # @api internal
  class DSL < BasicObject
    def self.run(object, on_setup = :run, &block)
      return object unless block
      instance = new
      instance.instance_eval { @object, @on_setup, @block = object, on_setup, block }
      block.arity == 0 ? instance.instance_eval(&block) : block.call(instance)
      object
    end

    # @api setup
    #
    # Applies the current setup to another application.
    # Optionally takes a block for per-application customization.
    #
    # @example
    #   Nii::Setup.new MyApplication do
    #     setup I18n # also use this configuration as I18n backend.
    #
    #     setup Nii::Middleware do
    #       # middleware specific congiguration
    #       insert_after Rack::Head
    #     end
    #
    #     # this applies to all three (MyApplication, Nii::Middleware, and I18n)
    #     available_locales "en", "fr"
    #   end
    def setup(application, &block)
      case @on_setup
      when :ignore
      when :complain
        ::Kernel.raise ::Nii::Errors::SetupError, 'cannot nest setup blocks'
      when :run
        if @object.subsetups.include? application
          return unless block
          ::Kernel.raise ::Nii::Errors::SetupError, "already ran setup for #{application.inspect}"
        end
        @object.subsetups[application] = ::Nii::Setup.new(application, nested: true) do |setup|
          ::Nii::Setup::DSL.run(setup, :ignore,   &@block)
          ::Nii::Setup::DSL.run(setup, :complain, &block)
        end
      else
        ::Kernel.raise ::Nii::Errors::SetupError, "unexpected value #{@on_setup.inspect} for on_setup"
      end
    end

    private

    def method_missing(method, *arguments, &block)
      return super if method.start_with? '_' or method == :initialize
      if arguments.any?
        if method.end_with? '='
          setter, getter = method, method[0..-2]
        else
          setter, getter = :"#{method}=", method
        end
        method = @object.respond_to?(setter) ? setter : getter
        result = @object.public_send(method, *arguments)
      else
        result = @object.public_send(method)
      end
      if block
        if result.respond_to? :__dsl__
          result.__dsl__(&block)
        else
          ::Nii::Setup::DSL.run(result, :complain, &block)
        end
      end
      result
    end
  end
end
