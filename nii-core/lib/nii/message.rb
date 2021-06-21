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

    # @return [#to_s, nil] source description (like file path or database table)
    # @note
    #   Whether this property is set as well as the exact type depend on the lookup implementation that retrieved the message.
    #   For lookup implementations based on {Nii::Lookup::FileSystem}, the value will be a {Nii::LoadPath::Pathname}.
    # @see #source_description
    attr_accessor :source

    # @api internal
    attr_reader :attributes

    # @api internal
    attr_reader :template
    alias_method :to_nii_template, :template

    # @api internal
    def initialize(name, template, **attributes)
      @name, @template, @attributes = name, template, attributes
    end

    # @api internal
    def bundle = template.bundle
    
    # @!attribute [r] locale
    # @return [Nii::Locale]
    def locale = bundle.locale
    
    # @!attribute [r] namespace
    # @return [String]
    def namespace = bundle.namespace

    # @see Nii::Context#render
    def render(context, variables, &block)
      context = Context.new(context) unless context.respond_to? :to_nii_context
      template.render(context.to_nii_context, variables, &block)
    end

    # @return [String, nil] {#source} described as a string
    def source_description
      return unless source = self.source
      source = source.relative_path if source.is_a? Nii::LoadPath::Pathname
      Nii::Utils.string(source)
    end

    # @overload compile_to(target, **options)
    #   Compiles the message object into the given format.
    #
    #   @example
    #     message = context.find_message "hello-world"
    #     puts message.compile_to(:fluent)
    #
    #   @param target [String, Symbol, #compile] Compilation target (example: +fluent+, +xliff+)
    #   @raise [Nii::CompileError]
    #   @return [String]
    def compile_to(...) = template.bundle.compiler(...).compile(self)

    # @param include_attributes [true, false] Whether or not to include variables used in message attributes.
    # @return [Array<String>] list of variables used in the message.
    def variables(include_attributes = true)
      @all_variables      ||= compile_to(:variables)
      @template_varibales ||= attributes.any? ? Nii::Compiler::Variables.compile(template) : @all_variables
      include_attributes ? @all_variables : @template_varibales
    end

    # Shorthand for {#compile_to} with fluent as target.
    # @return (see #compile_to)
    def to_fluent(**options) = compile_to(:fluent, **options)
    alias_method :to_ftl, :to_fluent

    # @return [Array]
    def to_sexp = template.to_sexp

    # @return [Array]
    def deconstruct = [name, description, template, attributes]
    
    # @return [Hash]
    def deconstruct_keys(keys) = { name: name, description: description, template: template, attributes: attributes }

    # @return [self]
    def to_nii_message = self

    # @api internal
    # @return [true, false]
    def nii_attribute?(name) = attributes.include?(name.to_sym)
    
    # @api internal
    def nii_attribute(name) = attributes.fetch(name.to_sym)
    
    # @return [String]
    def to_s = template.to_s

    # @private
    def inspect = "#<#{self.class.inspect}:#{name}>"
  end
end
