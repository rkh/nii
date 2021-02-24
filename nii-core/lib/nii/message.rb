# frozen_string_literal: true

module Nii
  class Message
    # @return [String] the message name/id
    attr_reader :name

    # @return [String, nil]
    #   A description for the message.
    #   Only supported for certain fromats, usually parsed from a comment
    #   right before the message.
    attr_accessor :description

    # @api internal
    attr_reader :attributes

    # @api internal
    attr_reader :template
    alias_method :to_nii_template, :template

    # @api internal
    def initialize(name, template, **attributes)
      @name, @template, @attributes = name, template, attributes
    end

    # @see Nii::Context#render
    def render(context, variables, &block)
      context = Context.new(context) unless context.respond_to? :to_nii_context
      template.render(context.to_nii_context, variables, &block)
    end

    # Compiles the message object into the given format.
    #
    # @example
    #   message = context.find_message "hello-world"
    #   puts message.compile_to :fluent
    #
    # @param target [String, Symbol, #compile] Compilation target (example: +fluent+, +xliff+)
    # @raise [Nii::CompileError]
    # @return [String]
    def compile_to(target, **options)
      if target.is_a? Symbol or target.is_a? String
        normalized = Utils.string(target).tr('-_', '').downcase
        constant   = Nii::Compiler.constants.detect { |c| c.name.downcase == normalized }
        raise Nii::CompileError, "#{target.inspect} not supported as compilation target" if constant.nil?
        target = Nii::Compiler.const_get(constant, false)
      end
      target = target.new(**options) if target.respond_to? :new
      target.compile(template)
    end

    # Shorthand for {#compile_to} with fluent as target.
    # @return (see #compile_to)
    def to_fluent(**options) = compile_to(:fluent, **options)
    alias_method :to_ftl, :to_fluent

    # @private
    def inspect = "#<#{self.class.inspect}:#{name}>"
  end
end
