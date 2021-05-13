# frozen_string_literal: true

module Nii::Lookup
  # An in-memory message lookup. Allows you to define messages in your Ruby code.
  # Usefule for single file applications and testing.
  #
  # @example
  #   messages = Nii::Lookup::Memory.new do
  #     namespace :example
  #     locale(:en) { add example: "example message"   }
  #     locale(:de) { add example: "Beispielnachricht" }
  #   end
  #
  #   context = Nii::Context.new :en, lookup: messages
  #   contex.render :example # => "example message"
  class Memory < Common
    Nii::Lookup[:memory] = self

    # @private
    def self.setup_class = Nii::Setup::Lookup::Memory

    # DSL object used by the block passed to {Memory#initialize}.
    class DSL
      # @api internal
      attr_reader :storage, :locales, :options

      # @api internal
      def initialize(storage, locales = [], options = {}, &block)
        @storage, @locales, @options = storage, locales, options
        block.arity == 0 ? instance_eval(&block) : call(instance) if block
      end

      # @overload add(name, message)
      #   Adds a new message.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       locale    :en
      #       namespace :example
      #
      #       add :example, "This is an example"
      #     end
      #
      #   @param name [String, Symbol]
      #   @param message [String]
      #   @return void
      #
      # @overload add(messages)
      #   Adds new messages to a lookup, based on a hash (message name mapped to message).
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       locale    :en
      #       namespace :example
      #
      #       add first: "first message", second: "second message"
      #     end
      #
      #   @param messages [Hash{String, Symbol => String}]
      #   @return void
      #
      # @overload add(source)
      #   Parses the given string as if it was read from a file. Uses the {#format} option.
      #   If it isn't set, it assumes the string usess Fluent.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       locale    :en
      #       namespace :example
      #
      #       add "hello-user = Hello {$name}!"
      #     end
      #
      #   @param source [String] the source code to parse messages from
      #   @return void
      def add(key_or_payload, payload = nil)
        return unless payload = payload ? { key_or_payload => payload } : key_or_payload
        compiler = Hash === payload ? HashCompiler.new(@format) : Nii::Formats[@format || :fluent]
        compiler.compile(bundle, payload)
      end

      # @overload namespace
      #   @return [String, nil] the current namespace
      #
      # @overload namespace(value)
      #   Sets the namespace. Any {#add} calls afterwards will use this namespace, any previous value will be discarded.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       locale :en
      #
      #       namespace :foo
      #       add :example, "this is a message from the namespace foo"
      #
      #       namespace :bar
      #       add :example, "this is a message from the namespace bar"
      #     end
      #
      #   @param value [String, Symbol, nil] the name of the namespace
      #   @return [String, nil] the current namespace
      #
      # @overload namespace(value)
      #   Uses the block to define messages for a namespace. Namespaces can be nested.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       locale :en
      #       namespace :foo do
      #         add :example, "this is a message from the namespace foo"
      #         namespace(:bar) { add :example, "this is a message from the namespace foo/bar" }
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the namespace.
      #   @param value [String, Symbol, nil] the name of the namespace
      #   @return [String, nil] the current namespace
      #
      # @overload namespace(value)
      #   Uses the block to define messages for a namespace. Namespaces can be nested.
      #
      #   @example
      #     Nii::Lookup::Memory.new do |main|
      #       main.locale :en
      #       main.namespace :foo do |foo|
      #         foo.add :example, "this is a message from the namespace foo"
      #         namespace(:bar) { |bar| bar.add :example, "this is a message from the namespace foo/bar" }
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the namespace.
      #   @yieldparam dsl [Nii::DSL] DSL instance to define messages.
      #   @param value [String, Symbol, nil] the name of the namespace
      #   @return [String, nil] the current namespace
      def namespace(value = Nii::UNDEFINED, &block)
        if value and value != Nii::UNDEFINED
          value = "#{namespace}/#{value}" if namespace and block
          value = Nii::Utils.string(value)
        end
        option(:namespace, value, &block)
      end

      # @overload locale
      #   @return [String, nil] the current locale
      #
      # @overload locale(value)
      #   Sets the locale. Any {#add} calls afterwards will use this locale, any previous value will be discarded.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       namespace :example
      #
      #       locale :en
      #       add :example, "example message"
      #
      #       locale :de
      #       add :example, "Beispielnachricht"
      #     end
      #
      #   @param value [String, Symbol, Nii::Locale, nil] the locale
      #   @return [String, nil] the current locale
      #
      # @overload locale(value)
      #   Uses the block to define messages for a locale.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       namespace :example
      #
      #       locale :en do
      #         add :example, "example message"
      #       end
      #
      #       locale :de do
      #         add :example, "Beispielnachricht"
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the locale.
      #   @param value [String, Symbol, Nii::Locale, nil] the locale
      #   @return [String, nil] the current locale
      #
      # @overload locale(value)
      #   Uses the block to define messages for a locale.
      #
      #   @example
      #     Nii::Lookup::Memory.new do |main|
      #       main.namespace :example
      #
      #       main.locale :en do |en|
      #         en.add :example, "example message"
      #       end
      #
      #       main.locale :de do |de|
      #         de.add :example, "Beispielnachricht"
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the locale.
      #   @yieldparam dsl [Nii::DSL] DSL instance to define messages.
      #   @param value [String, Symbol, Nii::Locale, nil] the locale
      #   @return [String, nil] the current locale
      def locale(value = Nii::UNDEFINED, &block)
        value = Nii::Locale.parse(value) if value and value != Nii::UNDEFINED
        option(:locale, value, &block)
      end

      alias_method :language, :locale


      # @note
      #   If you don't set the format (or set it to nil), Nii will attempt to detect the format automatically.
      #   It uses the same format detection logic applied to unspecific JSON/YAML files by default.
      #
      # @overload format
      #   @return [String, Symbol, nil] the current format
      #
      # @overload format(value)
      #   Sets the format. Any {#add} calls afterwards will use this format, any previous value will be discarded.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       namespace :example
      #       locale :en
      #
      #       format :i18n
      #       add :i18n_example, "Uses Ruby I18n compatible interpolation: %{name}"
      #
      #       format :r18n
      #       add :r18n_example, "Uses Ruby R18n compatible interpolation: {{name}}"
      #
      #       format :fluent
      #       add "fluent_example = Uses Fluent Syntax: {$name}"
      #     end
      #
      #   @param value [String, Symbol, nil] The format identifier (not the file extension).
      #   @return [String, Symbol, nil] the current format
      #
      # @overload format(value)
      #   Uses the block to define messages for a format.
      #
      #   @example
      #     Nii::Lookup::Memory.new do
      #       namespace :example
      #       locale :en
      #
      #       format :i18n do
      #         add :i18n_example, "Uses Ruby I18n compatible interpolation: %{name}"
      #       end
      #
      #       format :r18n do
      #         add :r18n_example, "Uses Ruby R18n compatible interpolation: {{name}}"
      #       end
      #
      #       format :fluent do
      #         add "fluent_example = Uses Fluent Syntax: {$name}"
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the format.
      #   @param value [String, Symbol, nil] The format identifier (not the file extension).
      #   @return [String, Symbol, nil] the current format
      #
      # @overload format(value)
      #   Uses the block to define messages for a format.
      #
      #   @example
      #     Nii::Lookup::Memory.new do |main|
      #       main.namespace :example
      #       main.locale :en
      #
      #       format :i18n do |i18n|
      #         i18n.add :i18n_example, "Uses Ruby I18n compatible interpolation: %{name}"
      #       end
      #
      #       format :r18n do |r18n|
      #         r18n.add :r18n_example, "Uses Ruby R18n compatible interpolation: {{name}}"
      #       end
      #
      #       format :fluent do |fluent|
      #         fluent.add "fluent_example = Uses Fluent Syntax: {$name}"
      #       end
      #     end
      #
      #   @yield Block to be used to define messages for the format.
      #   @yieldparam dsl [Nii::DSL] DSL instance to define messages.
      #   @param value [String, Symbol, nil] The format identifier (not the file extension).
      #   @return [String, Symbol, nil] the current format
      def format(...) = option(:format, ...)

      private

      def option(key, value = Nii::UNDEFINED, &block)
        return options[key] if value == Nii::UNDEFINED
        return options[key] = value unless block
        DSL.new(storage, locales, options.merge(key => value), &block).options[key]
      end

      def bundle
        raise ArgumentError, 'cannot add a message without namespace and locale' unless locale and namespace
        @locales << locale unless @locales.include? locale
        @storage.fetch_or_store(locale.to_s) { Concurrent::Map.new }.fetch_or_store(namespace) { Nii::Bundle.new(locale, namespace) }
      end
    end

    # @api internal
    # Compiles messages from a given hash (JSON logic but without parsing it as JSON first).
    class HashCompiler < Nii::Formats::JSON
      def initialize(format) = super(messages: format)
      def format_config      = config
      def parse(hash)        = hash.transform_keys(&:to_s)
    end

    private_constant :HashCompiler

    # @overload initialize(config = nil)
    #   @yield block to define messages
    #   @example
    #     Nii::Lookup::Memory.new do
    #       namespace :example
    #       locale(:en) { add example: "example message"   }
    #       locale(:de) { add example: "Beispielnachricht" }
    #     end
    #
    # @overload initialize(config = nil)
    #   @yield [dsl] block to define messages
    #   @yieldparam dsl [Nii::Lookup::Memory::DSL]
    #   @example
    #     Nii::Lookup::Memory.new do |main|
    #       main.namespace :example
    #       main.locale(:en) { |en| en.add example: "example message"   }
    #       main.locale(:de) { |de| de.add example: "Beispielnachricht" }
    #     end
    #
    # @param config [nil, Hash, Nii::Config, #to_nii_config]
    def initialize(config = nil, &block)
      super
      @locales = DSL.new(@namespaces, &block).locales
    end

    private
    def load_namespace(locale, namespace) = @namespaces[nil]
    def lookup(bundle, message) = bundle.find(message)
    def scan_locales = @locales
  end
end
