# frozen_string_literal: true

module Nii
  class Context
    include Helpers::Territories, Helpers::Languages

    # @see #localize?
    LOCALIZABLE         = [Symbol, Array, Hash, Set]
    IMPLICIT_CONVERSION = { to_hash: Hash, to_ary: Array, to_str: String, to_int: Numeric }
    private_constant :LOCALIZABLE, :IMPLICIT_CONVERSION

    # Keys available for pattern matching.
    DECONSTRUCT_KEYS = %i[
      available_locales config currency data_locale fallback locale locale_config locale_preference
      lookup measurement_system scope text timezone variables
    ].freeze

    # @overload new(context)
    #   @param context [#to_nii_context, Nii::Context, Nii::Helpers]
    #   @return [Nii::Context] the result of calling {#to_nii_context} on the passed argument
    #
    # @overload new(*locale_preference, *config)
    #   @param locale_preference [Array<String, Symbol, Locale, LocalePreference>]
    #     Indicates the locale preferences of the client. Will be used in locale negotiation.
    # 
    #     It accepts the same arguments as {LocalePreference} except for the options hash.
    #     This means you can also pass the value of an Accept-Language HTTP header directly.
    #
    #     Passing more than one argument is additive: Passing both "de" and "de-AT" means both
    #     generic German and Austrian German are acceptable. Argument order expresses preference.
    #     You should therefore pass any user generated input first (like an Accept-Header or query parameter).
    #
    #     Handing any locales to {.new} will always use them for locale negotiation, even if it is a
    #     single {Nii::Locale}. It is therefore different from setting a locale explicitely via
    #     {#locale=}, which will skip locale negotiation all together.
    # 
    #   @param config [Array<Hash, Config, #to_h, #to_nii_config>]
    #     The configuration to use for the context and all objects created by the context.
    #     Passing more than one configuration object will result in a combined configuration
    #     via {Config#merge}. This config can be generate by {Nii::Setup}.
    #
    #   @option config [LocalePreference] available_locales
    #     Used for limiting locales during locale negotiation. Ignored if locale is set explicitely.
    #     If set, negotiation will be using this property, in addition to {#locale_preference}
    #     and {Nii::Lookup::Common#available_locales}.
    #
    #   @option config [Nii::Lookup::Common] lookup
    #     Template lookup to use. Same as calling {#lookup=}.
    #
    #   @option config [String, Symbol] namespace
    #     The default namespace to use when {#render} or {#find_message} is called without the +namespace+ option.
    #
    #   @option config [String, Symbol, Nii::Territory, #to_nii_territory] territory
    #     Overrides {#territory}, and thus all territory based information.
    #
    #   @option config [String, Symbol, Nii::Locale, #to_nii_locale] fallback_locale
    #     Sets the locale to fall back to if messages aren't available for {#locale}.
    #
    #   @option config [Array<String, Symbol, Nii::Locale, #to_nii_locale>] fallback_locales
    #     Same as +fallback_locale+, but accepts a list of locales to fall back to in turn.
    #
    #   @option config [Locale] data_locale
    #     Overrides which locale to use to look up CLDR data.
    #
    #   @option config [Encoding, String] encoding
    #     Overrides which encoding will be used, defaults to +Encoding.default_internal+ (and UTF-8 if it is not set).
    #
    #   @option config [Class, #invoke] functions (Nii::Functions)
    #     Object or class used for invoking functions from within message templates.
    #
    #     If it is a class, #new will be called with the context object as sole argument, and the return
    #     value will be used as functions object. Otherwise it will be used directly.
    #
    #     The only method called on the functions object is #invoke. It is therefore possible to pass
    #     a BasicObject.
    #
    #   @option config ["US", "UK", "metric", nil] measurement_system
    #     Overrides the measurement_system (and thus ignored whatever value is passed via locale preference).
    #     This config option is in turn ignored if the locale is set explicitley (by calling {#locale=}).
    #     See {Info::MeasurementSystem}.
    #
    #   @option config [Symbol, String, nil] numbering_system
    #     Overrides the numbering_system (and thus ignored whatever value is passed via locale preference).
    #     This config option is in turn ignored if the locale is set explicitley (by calling {#locale=}).
    #     See {Info::Numbers}
    #
    #   @yield
    #     passes the newly created context to the block
    #
    #   @yieldparam context [Nii::Context]
    #     the new context (same object as the return value)
    #
    #   @return [Nii::Context]
    #     the new context
    #
    # @note Passing an object that responds to {#to_nii_context} will not call any block passed to {.new}.
    #   You can therefore use a block to only adjust a newly created context. This is helpful for writing
    #   methods that accept a {Locale}, {LocalePreference}, or {Context} as argument.
    def self.new(*arguments)
      case arguments
      in [ Context => argument ]              then argument
      in [ Helpers => argument ]              then argument.nii
      in [a] if a.respond_to? :to_nii_context then a.to_nii_context
      else super
      end
    end

    # The client's locale preference.
    # Setting this will drop any preferences allready passed to {.new}.
    # Can be set to {LocalePreference}, {Locale}, or String, but the
    # attribute will always be converted into a {LocalePreference}.
    #
    # @example overriding locale preference
    #   context = Nii::Context.new('en')
    #   context.locale_preference = 'de'
    #   context.locale_preference # => #<Nii::LocalePreference:[#<Nii::Locale:de>]>
    #
    # @example adding locale preferences
    #   context = Nii::Context.new('en')
    #   context.locale_preference += 'de'
    #   context.locale_preference # => #<Nii::LocalePreference:[#<Nii::Locale:en>, #<Nii::Locale:de>]>
    #
    # @example limiting locales via pre-negotiation
    #   context = Nii::Context.new('en-US', 'de-DE')
    #   context.locale_preference &= 'de'
    #   context.locale_preference # => #<Nii::LocalePreference:[#<Nii::Locale:de-DE>]>
    #
    # @return [LocalePreference] preference to use for locale negotiation
    attr_reader :locale_preference
    def locale_preference=(value)
      @locale_preference = LocalePreference.new(value)
      reset_locale
    end

    # The template lookup to use.
    # Objects set as lookup need to implement {Nii::Lookup::Common#available_locales} and {Nii::Lookup::Common#find}.
    # @return [Lookup::Common] template lookup to use
    attr_reader :lookup
    def lookup=(value)
      @available_locales = nil unless @explicit_available
      @messages          = {}
      @lookup            = value
      reset_locale
    end

    # @!attribute available_locales
    #   List of available locales, as {Nii::LocalePreference}. Will be used for locale negotiations.
    #
    #   When explicitely assigning this attribute, you may also use a {Nii::Locale}, locale or Accept-Language compatible String,
    #   or an Array of these.
    #
    #   If this hasn't been set explicitely, the default will be base on +config.available_locales+ and/or +lookup.available_locales+.
    #   Returns +nil+ if neither is available.
    #
    #   @return [LocalePreference, nil]
    def available_locales
      @available_locales ||= begin
        if config.available_locales?
          locales = LocalePreference.new(config.available_locales)
          lookup ? locales & lookup.available_locales : locales
        elsif lookup
          LocalePreference.new(lookup.available_locales)
        end
      end
    end

    def available_locales=(value)
      if value
        @explicit_available = true
        @available_locales  = LocalePreference.new(value)
      else
        @explicit_available = false
        @available_locales  = nil
      end
    end
  
    # @return [Config] config object
    attr_accessor :config
    protected :config=


    # @return [Encoding] string encoding for generated output
    attr_reader :encoding

    # @api internal
    # @see .new
    def initialize(*arguments)
      @config, arguments    = Config.extract(arguments)
      @explicit_locale      = false
      @explicit_available   = false
      @locale_preference    = LocalePreference.new(arguments)
      @variables            = {}
      @info                 = {}
      @lookup               = config.lookup
      @variable_formatters  = {}
      @encoding             = Encoding.find(locale_config.encoding || Encoding.default_internal || 'UTF-8')
      @messages             = {}
      @explit_territory     = false
      @locale_as_preference = false
      
      case config.functions
      when Class then @functions = config.functions.new(self)
      when nil   then @functions = Nii::Functions.new(self)
      else            @functions = config.functions
      end

      reset_locale
      self.scope  = config.scope  if config.scope?
      self.locale = config.locale if config.locale?
      yield self if block_given?
    end

    # @api internal
    def initialize_copy(other)
      super
      @variables           = @variables.dup
      @variable_formatters = @variable_formatters.dup
      @messages            = {}
    end

    # @overload subcontext(locale)
    #   @param locale [String, Symbol::Nii::Locale]
    #   @return [Nii::Context] the subcontext with adjusted locale.
    #
    # @overload subcontext(locale)
    #   @param locale [String, Symbol::Nii::Locale]
    #   @yield [subcontext] block called for the subcontext.
    #   @yieldparam subcontext [Nii::Context] the subcontext with adjusted locale.
    #   @return [Object] the same value as the block's return value.
    #
    # @overload subcontext(config)
    #   @param config [Nii::Config, Hash]
    #   @return [Nii::Context] the subcontext with adjusted config.
    #
    # @overload subcontext(config)
    #   @param config [Nii::Config, Hash]
    #   @yield [subcontext] block called for the subcontext.
    #   @yieldparam subcontext [Nii::Context] the subcontext with adjusted config.
    #   @return [Object] the same value as the block's return value.
    #
    # @overload subcontext(locale, config)
    #   @param locale [String, Symbol::Nii::Locale]
    #   @param config [Nii::Config, Hash]
    #   @return [Nii::Context] the subcontext with adjusted locale and config.
    #
    # @overload subcontext(locale, config)
    #   @param locale [String, Symbol::Nii::Locale]
    #   @param config [Nii::Config, Hash]
    #   @yield [subcontext] block called for the subcontext.
    #   @yieldparam subcontext [Nii::Context] the subcontext with adjusted locale and config.
    #   @return [Object] the same value as the block's return value.
    #
    # @note Creating a subcontext will trigger locale negotiation (if it hasn't been triggered yet).
    def subcontext(*arguments)
      subcontext        = dup
      config, arguments = Config.extract(arguments)
      subcontext.config = @config.merge(config)

      if locale = arguments.shift
        subcontext.locale           = locale
        subcontext.fallback_locales = subcontext.fallback_locales - [locale]
      end

      raise ArgumentError, "unexpected argument: #{arguments.first.inspect}" if arguments.any?
      block_given? ? yield(subcontext) : subcontext
    end

    alias_method :with, :subcontext

    # @overload scope
    #   @return [Object] the context's scoping object
    #   @see #scope=
    #
    # @overload scope(object, config = nil)
    #   @note  (see #subcontext)
    #   @param (see #scope=)
    #   @param config [Nii::Config, Hash]
    #   @return [Nii::Context] a subcontext scoped for the given object
    #   @see #subcontext
    #
    # @overload scope(object, config = nil)
    #   @note  (see #subcontext)
    #   @param (see #scope=)
    #   @param config [Nii::Config, Hash]
    #   @yield [subcontext] block called for the scoped subcontext.
    #   @yieldparam subcontext [Nii::Context] the subcontext with adjusted locale and config.
    #   @return [Object] the same value as the block's return value.
    #   @see #subcontext
    def scope(object = Nii::UNDEFINED, *arguments)
      return @scope if object == Nii::UNDEFINED
      subcontext       = subcontext(*arguments)
      subcontext.scope = object
      block_given? ? yield(subcontext) : subcontext
    end

    alias_method :for, :scope

    # @param object [Object] will be set as scope
    def scope=(object)
      return if scope == @scope
      @unscoped_config ||= @config

      options        = scope_options(scope)
      @config        = options&.any? ? @unscoped_config.merge(options) : @unscoped_config
      @locale_config = nil
      @scope         = object
    end

    # @api internal
    def scope_options(scope)
      @scope_options ||= ScopeOptions.new(config.scope_options)
      @scope_options.for(scope)
    end

    # def subcontext(config = nil)
    #   subcontext                   = Context.new(@config, config)
    #   subcontext.locale_preference = locale_preference
    #   subcontext.variables         = variables.dup
    # end

    # Will return the primary locale if it has been set explicitely or has already been negotiated.
    # Will trigger locale negotiation if everythis is ready for negotiation or if +force+ is +true+.
    #
    # @example calling locale before the context is ready to negotiate
    #   context = Nii::Context.new
    #   context.locale       # => nil
    #   context.locale(true) # => #<Nii::Locale:und-001>
    #
    # @example calling locale when the context is ready to negotiate
    #   lookup  = Nii::Lookup.new('config/locales') # assuming this defined en and de messages
    #   context = Nii::Context.new('gsw', 'de-CH', 'en', lookup: lookup)
    #   context.locale(false) # => #<Nii::Locale:de-CH>
    #
    # @return [Nii::Locale, nil] the primary locale to be used by the context, if already available
    def locale(force = true)
      @locale || negotiate_locale(force)
    end

    # Explicitely overrides the locale. Skips any locale negotiation.
    # Setting this to +nil+ will reset the context to use negotiation.
    #
    # @param value [Nii::Locale, String, Symbol, nil]
    def locale=(value)
      case value
      when LocalePreference
        @locale_preference_was = @locale_preference unless @locale_as_preference
        @locale_as_preference  = true
        @locale_preference     = value
        @locale                = nil
        @explicit_locale       = false
      when nil
        @locale_preference    = @locale_preference_was if @locale_as_preference
        @locale_as_preference = false
        @locale               = nil
        @explicit_locale      = true
      else
        @locale_preference    = @locale_preference_was if @locale_as_preference
        @locale_as_preference = false
        @locale               = Locale.parse(value)
        @explicit_locale      = false
      end

      reset_locale(@locale, true)
      normalize_locale
    end

    # locale specific config
    # @api internal
    def locale_config
      @locale_config ||= config.for(locale(true))
    end
    
    # Locale used for looking up CLDR data.
    #
    # @example
    #   Nii::Context.new('en-US').data_locale     # => 'en-US'
    #   Nii::Context.new('no-bokmal').data_locale # => 'no-NO'
    #
    # @param force [true, false] same as the +force+ parameter for {#locale}
    def data_locale(force = true)
      return unless force or locale
      @data_locale ||= begin
        candidate = locale_config.data_locale || locale(force).lookup.detect { |l| config.data.locale_known? l }
        Locale.parse(config.data.locale_data(candidate, :info, :@locale) || candidate)
      end
    end

    # @overload has_message?(message, **options)
    #   @return [true, false] Whether or not a message is available.
    def has_message?(...) = !!find_message(...)
    alias_method :message?, :has_message?

    # Finds a message object for a given message key.
    #
    # @param message [String, Symbol, #to_nii_template]
    #   the message key or message object
    #
    # @param use_fallback [true, false]
    #   whether or not to check {#fallback_locales} as well if the message isn't found for the current {#locale}.
    #
    # @param options [Hash{Symbol => Object}]
    #   will be passed to {Lookup::Common#find}
    #
    # @return [Nii::Message, nil]
    #   the message (if it could be found)
    def find_message(message, use_fallback: true, **options)
      return message.to_nii_message if message.respond_to? :to_nii_message
      return with_fallbacks { |c| c.find_message(message, use_fallback: false, **options) } if use_fallback

      message = Utils.string(message)
      key     = options.any? ? [message, options] : message
      stored  = @messages[key] ||= nil
      return stored if stored
      return unless lookup

      lookup_chain.each do |locale|
        result = lookup.find(locale, message, default_namespace: config.namespace, **options)
        return @messages[key] = result if result
      end

      nil
    end

    # Renders a message. Will use {#find_message} to resolve the message, then calls {Message#render} on that message.
    #
    # @param message [String, Symbol, #to_nii_template]
    #   the message to render.
    #
    # @param variables [Hash, Array]
    #   variables to pass to the message template for rendering, will be merged into {#variables}.
    #
    # @param default [Object]
    #   default value to be returned if message couldn't be found.
    #
    # @param scope [Object]
    #   the rendering scope for the message, see {#scope}.
    #
    # @param use_fallback [true, false]
    #   whether or not to check {#fallback_locales} as well if the message isn't found for the current {#locale}.
    #
    # @param options [Hash{Symbol => Object}]
    #   will be passed to {Lookup::Common#find}.
    #
    # @return [String, default]
    def render(message, variables = nil, default: Nii::UNDEFINED, scope: self.scope, use_fallback: true, **options, &block)
      return scope(scope).render(message, variables, default: default, use_fallback: use_fallback, **options, &block) if scope != self.scope
      @render_cache ||= Nii::Cache.new
      @render_cache.fetch(message, variables, options) do
        context, template = with_fallbacks(use_fallback: use_fallback, include_context: true) do |c|
          c.find_message(message, use_fallback: false, **options)
        end

        if template
          variables = variables(variables)
          template.render(context, variables, &block)
        else
          default = default.call if default.respond_to? :call
          return default if default != Nii::UNDEFINED
          unknown_message(message)
        end
      end
    end

    alias_method :translate, :render
    alias_method :t, :render

    # @!macro [new] format
    #   @param options [Hash]
    #     A customizable set of options. Unknown and unsupported options are ignored.
    #     Multiple options have aliases. Which option is picked if both the proper option and its alias are passed is undefined behavior
    #     (with the current implementation, this is order depended, with later options overriding earlier options).
    #
    #   @option options [nil, true, false] escape_html (nil)
    #     Whether or not to escape HTML entities. If set to +nil+, this will default to {#escape_html?}
    #
    #   @option options [nil, true, false, Hash, Symbol, String] bidi (nil)
    #     Controls Unicode BiDi support. The given option will be passed to {Nii::Info::Text#bidi}. 
    #
    #   @yield [string]
    #     Callback to modify the return value.
    #     The block is before any escaping or directionality logic processes the string,
    #     but after the string has been converted to the proper encoding.
    #   @yieldparam string [String] The localized object representation.
    #   @yieldreturn [String] The string to replace the localized object representation with.
    #
    #   @raise [ArgumentError] Raised if an option has an unsupported value.
    #   @return [String, Nii::HTMLString] Localized object representation.
    #   @see #localize

    # @note
    #   If you want to implement a custom formatter, you only need to implement
    #   +format(context, value, **options)+, which is expected to return a string. All options are handed
    #   on exactly as they are passed to Context#format, except for +escape_html+, which is ommitted.
    #
    # Unknown options will be ignored. Available options depend on the chosen formatter.
    # Generates a localized string representing the given object.
    #
    # @overload format(object = scope, **options)
    #   Finds the appropriate formatter by looking for the following for the object's class, in order:
    #   * An entry in +config.formatters+.
    #   * The return value of calling +to_nii_formatter+ on the class (if it implements this method).
    #   * A constant with the same name, but nested inside {Nii::Formatters}.
    #   * Repeat these steps for the superclass.
    #
    #   If none of these results in a formatter, it will call +to_s+ on the object and format the result.
    #
    #   @param object [Object]
    #   @macro format
    #
    # @overload format(date = scope, **options)
    #   Formats a date.
    #
    #   @param   date [::Date, Nii::Date]
    #   @macro   format
    #   @option  (see Nii::Formatters::Date.format)
    #   @example (see Nii::Formatters::Date.format)
    #   @note    (see Nii::Formatters::Date.format)
    #   @see     Nii::Formatters::Date
    #
    # @overload format(list = scope, **options)
    #   Formats a list of objects.
    #
    #   The given options will also be used to format each
    #   object in the list.
    #
    #   @param   list [Array, Set, Concurrent::Tuple]
    #   @macro   format
    #   @option  (see Nii::Formatters::Array.format)
    #   @example (see Nii::Formatters::Array.format)
    #   @note    (see Nii::Formatters::Array.format)
    #   @see     Nii::Formatters::Array
    #
    # @overload format(hash = scope, **options)
    #   Formats a key-value mapping.
    #
    #   The given options will also be used to format each
    #   object in the list (except for the keys/values option,
    #   which will only apply to the keys or values)
    #
    #   @param   list [Hash, Concurrent::Hash, Concurrent::Map]
    #   @macro   format
    #   @option  (see Nii::Formatters::Hash.format)
    #   @example (see Nii::Formatters::Hash.format)
    #   @note    (see Nii::Formatters::Hash.format)
    #   @see     Nii::Formatters::Hash
    #
    # @overload format(money = scope, **options)
    #   Formats a money object.
    #
    #   @param   money   [Money]
    #   @param   options [Hash]   Same options as for a number (see below).
    #   @note    (see Nii::Formatters::Money.format)
    #   @example (see Nii::Formatters::Money.format)
    #   @return  [String, Nii::HTMLString] localized object representation
    #   @see     Nii::Formatters::Money
    #
    # @overload format(number = scope, **options)
    #   Formats a number.
    #
    #   @param   number [Numeric]
    #   @macro   format
    #   @option  (see Nii::Formatters::Numeric.format)
    #   @example (see Nii::Formatters::Numeric.format)
    #   @note    (see Nii::Formatters::Numeric.format)
    #   @see     Nii::Formatters::Numeric
    #
    # @overload format(string = scope, **options)
    #   Formats a string.
    #
    #   @param   string [String, Nii::HTMLString, ActiveSupport::SafeBuffer]
    #   @macro   format
    #   @option  (see Nii::Formatters::String.format)
    #   @example (see Nii::Formatters::String.format)
    #   @note    (see Nii::Formatters::String.format)
    #   @see     Nii::Formatters::String
    #
    # @overload format(time = scope, **options)
    #   Formats a time.
    #
    #   @param   time [Time, ActiveSupport::TimeWithZone]
    #   @macro   format
    #   @option  (see Nii::Formatters::Time.format)
    #   @example (see Nii::Formatters::Time.format)
    #   @note    (see Nii::Formatters::Time.format)
    #   @see     Nii::Formatters::Time
    #
    # @overload format(timezone = scope, **options)
    #   Formats a timezone.
    #
    #   @param   timezone [TZInfo::Timezone, ActiveSupport::Timezone]
    #   @macro   format
    #   @option  (see Nii::Formatters::TZInfo::Timezone.format)
    #   @example (see Nii::Formatters::TZInfo::Timezone.format)
    #   @note    (see Nii::Formatters::TZInfo::Timezone.format)
    #   @see     Nii::Formatters::TZInfo::Timezone
    def format(value = scope, **options, &block)
      return value.format(**options, &block) if value.is_a? Localized

      escape_html        = options[:escape_html]
      bidi               = options[:bidi]
      escape_html        = options[:escape_html] = escape_html?   if escape_html.nil?
      bidi               = options[:bidi]        = text.bidi_mode if bidi.nil?
      return value if value.is_a? String and options.all? { !_2 } and !escape_html

      value              = prepare_format(value)
      value, formatter   = Utils.string(value), Formatters::String unless formatter = Formatters[value.class, config]
      result             = formatter.format(self, value, **options, &block)
      return result unless result.is_a? String
  
      result             = result.encode(encoding)
      escape_html        = false if escape_html and formatter.respond_to?(:escape?) and !formatter.escape?(value, **options)
      result             = yield(result) if block_given? and (!formatter.respond_to?(:yield?) or formatter.yield?(result))
      result             = escape_html ? html.format(result) : result
      bidi_options, bidi = bidi, true if bidi.is_a? Hash

      text.bidi(result, bidi, **bidi_options.to_h)
    end

    # Whether or not output from {#format} and {#render} should be HTML escaped by default.
    # This value will be used if the +escape_html+ option for {#format} is not set.
    # @return [true, false]
    def escape_html? = config.escape_html != false

    # Turns a Ruby object into a localized version of it.
    #
    # This allows, amongst other things, for object oriented model translation, as well as reformatting
    # of already formatted values. The resulting object will still respond to the same methods as the
    # original object, but retain formatting options.
    #
    # Calling +to_s+ or +format+ on the localized object will call {#format}.
    # Might return the object itself if it cannot be localized.
    #
    # @return [Nii::Localized, Object]
    def localize(value, **options)
      return value.nii_localize(self, **options) if value.respond_to? :nii_localize
      case value = prepare_format(value)
      when Hash  then Localized.new(value.transform_values { |v| localize(v, **options) })
      when Array then Localized.new(value.map { |v| localize(v, **options) })
      when Set   then Localized.new(value.dup.map! { |v| localize(v, **options) })
      else localize?(value) ? Localized.new(value, self, **options) : value
      end
    end

    # @see #localize
    # @see Nii::Localized#__localize__?
    # @api internal
    def localize?(value)
      return true if LOCALIZABLE.include? value.class
      return true if value.respond_to? :nii_localize
      return true if Formatters[value.class, config]
      IMPLICIT_CONVERSION.keys.any? { |method| value.respond_to? method }
    end


    # Partially or fully formats a variable based on a given block or pre-registered formatter.
    # @api internal
    def format_variable!(variable, value, &block)
      block ||= @variable_formatters[variable] || @variable_formatters[nil]
      result = block.arity == 1 ? block.call(value) : block.call(variable, value) if block
      
      case result
      when Localized then result
      when true, nil then value
      when false     then nil
      else Localized.new(value, self, format(result))
      end
    end

    # Sets up a rendering callback for a variable.
    #
    # @overload format_variable(variable, **options)
    #   @param variable [Symbol, String] variable name to register the formatter for
    #   @param options [Hash] options to pass to {#format}
    #
    #   The options will be stored for alter and used by {#render}.
    #
    # @overload format_variable(variable)
    #   @param variable [Symbol, String] variable name to register the formatter for
    #   @yield [value] Callback to fromat the variable's value.
    #   @yieldparam value [Object] variable value to format for rendering.
    #   @yieldreturn [String, Object, nil] Formatted value.
    #     * A String will be rendered directly.
    #     * +nil+ will be ignored and the fallback formatter will be used instead.
    #     * Other objects will be passed to {#format}.
    #
    #   The callback will be stored for later and called by {#render}.
    #
    # @overload format_variable
    #   @yield [variable, value] Callback to fromat the variable's value.
    #   @yieldparam variable [String] name of the variable to be formatted
    #   @yieldparam value [Object] variable value to format for rendering.
    #   @yieldreturn [String, Object, nil] Formatted value.
    #     * A String will be rendered directly.
    #     * +nil+ will be ignored and the fallback formatter will be used instead.
    #     * Other objects will be passed to {#format}.
    #
    # @example passing {#format} options
    #   # set up format options for amount
    #   context.format_variable 'amount', style: :currency, currency: 'USD'
    #
    #   # amount will be formatted as $200
    #   context.render :payment, { 'amount' => 200 }
    #
    # @example using a block for a single variable
    #   # ideal for inserting markup
    #   context.format_variable 'user' do |user|
    #     # use context.html for proper escaping and to play nice with Rails
    #     context.html '<a href="?">?</a>', user.profile_link, user.name
    #   end
    #
    #   # will insert user name as link
    #   context.render :some_message, user: current_user
    #
    # @example using a block for all variables
    #   # if you want this to always apply for all contexts,
    #   # you could also use a custom formatter class
    #   context.format_variable do |key, value|
    #     next unless value.is_a? User
    #     context.html '<a href="?">?</a>', value.profile_link, value.name
    #   end
    #
    #   # will insert user name as link
    #   context.render :some_message, user: current_user
    #
    # @return [self]
    def format_variable(variable = nil, **options, &block)
      variable = normalize_variable_name(variable)
      block  ||= proc { |value| localize(value, **options) }
      @variable_formatters[variable] = block
      self
    end

    # Retrieves a context-wide variable.
    # This variable will be used by {#render}.
    #
    # @param key [String, Symbol] variable name
    # @return [Object] variable value
    def [](key)
      @variables[normalize_variable_name(key)]
    end

    # Sets a context-wide variable.
    # This variable will be used by {#render}.
    #
    # @param key [String, Symbol] variable name
    # @return [Object] variable value
    def []=(key, value)
      @variables[normalize_variable_name(key)] = value
    end

    # @!attribute variables
    # Variables that will be used by {#render}.
    # @return [Hash{String => Object}] all context-wide variables
    def variables(variables = nil) = variables ? @variables.merge(normalize_variables(variables)) : @variables
    def variables=(variables)
      @variables = normalize_variables(variables)
    end

    # @api internal
    def normalize_variables(variables)
      case variables
      when Hash  then variables.transform_keys { |key| normalize_variable_name(key) }
      when Array then normalize_variables(variables.each_with_index.map { |v,i| v.is_a?(Hash) ? v : { i => v }  }.inject(:merge!))
      else variables.respond_to?(:to_h) ? normalize_variables(variables.to_h) : normalize_variables([variables])
      end
    end

    # @api internal
    # placeholder to allow more advanced normalization in the future
    def normalize_variable_name(name) = Utils.string(name)

    def call_function(function, ...)
      @functions.invoke(function, ...)
    end

    # Retrives an attribute for a given object.
    # @see Nii::Template::Attribute
    # @api internal
    def get_attribute(object, attribute)
      attribute = attribute.to_sym
      object    = localize(object) unless object.respond_to? :nii_attribute?
      return object.nii_attribute(attribute) if object.nii_attribute? attribute
      raise Errors::UnknownAttribute, "unknown attribute"
    end

    # @todo better implementation
    # @api internal
    def unknown_variable(key, variables)
      raise Errors::UnknownVariable, "unknown variable: #{key.inspect}"
    end

    # @todo better implementation
    # @api internal
    def unknown_message(message)
      raise Errors::UnknownMessage, "unknown message: #{message.inspect}"
    end

    # @param force [true, false] behaves like the +force+ parameter for {#locale}.
    # @return [Nii:Territory, nil] the negotiated (or explicitely set) territory
    def territory(force = true)
      return unless force or locale
      @territory ||= Territory.new(locale_config.territory || locale(force).territory || data_locale.territory, locale_config)
    end

    # @param force [true, false] behaves like the +force+ parameter for {#locale}.
    # @return [Nii::Currency, nil]
    def currency(force = true)
      return unless locale(force)
      @currency ||= begin
        code = locale_config.currency || territory.currency
        Currency.new(code, locale_config) if code
      end
    end

    # @param (see #currency)
    # @return [true, false]
    def currency?(force = true) = !!currency(force)

    # Indicates whether or not the locale has been set explicitely (and thus whether locale negotiation has been skipped).
    # @return [true, false]
    def explicit_locale? = @explicit_locale

    # Fallback locales to use for resolving messages that don't exist for the current locales.
    #
    # There are multiple ways this is determined, if not explicitely set via {#fallback_locales=}.
    # * Use config.fallback_locale or config.fallback_locales
    # * If config.auto_fallbacks is enabled: Add any locales left in {#locale_preference} (that are avaialble).
    # * If config.filter_fallbacks is enabled: Remove any locales that don't match the {#locale_preference}.
    # * Remove any entries that are already in the locale's lookup chain (see {Nii::Locale#lookup}).
    #
    # +auto_fallbacks+ and +filter_fallbacks+ will be ignored if the locale or fallback locale is set explicitiely.
    #
    # @example With auto fallbacks
    #   context = Nii::Context.new "gsw", "de-CH", "en", auto_fallbacks: true
    #   context.fallback_locales # => [#<Nii::Locale:de-CH>, #<Nii::Locale:en>]
    #
    # @example With explicit fallback
    #   context = Nii::Context.new "gsw"
    #   context.fallback_locale = "de-CH"
    #   context.fallback_locales # => [#<Nii::Locale:de-CH>]
    #
    # @return [Array<Locale>] ordered list of locales to fall back to if a message could not be resolved for a given locale.
    def fallback_locales
      @fallback_locales ||= begin
        fallbacks = Array(locale_config.fallback_locale || locale_config.fallback_locales).map { |l| Nii::Locale.parse(l) }
        unless explicit_locale?
          fallbacks.concat(locale_preference.to_a) if config.auto_fallbacks?
          fallbacks.select! { |l| locale_preference.superset_of? l and l != locale } if config.filter_fallbacks?
          fallbacks.reject! { |l| lookup_chain.include? l }
          fallbacks.select! { |l| available_locales.superset_of? l }
        end
        fallbacks.freeze
      end
    end

    # Sets the fallback locales.
    # @param value [Array<Locale, String, Symbol>, Locale, String, Symbol]
    # @see #fallback_locales
    # @see #fallback
    def fallback_locales=(value)
      @fallback_locales = Array(value).map { |l| Nii::Locale.parse(l) }
      @fallback_context = nil
    end

    alias_method :fallback_locale=, :fallback_locales=

    # @return [Nii::Context]
    #   subcontext used for message fallback.
    #   Based on {#fallback_locales}.
    #
    # @see #fallback_locales
    # @see #subcontext
    def fallback_context
      return if fallback_locales.empty?
      @fallback_context ||= subcontext(fallback_locales.first)
    end

    alias_method :fallback, :fallback_context

    # Calls a block with itself as argument. If the block returns +nil+ and a {#fallback_context} is available,
    # it will retry with the fallback instead (and repeat this for the fallback's fallback and so on).
    #
    # @param use_fallback [true, false]
    #   If set to false, the given block will only be run for the current context, and any {#fallback_locales}
    #   will be ignored.
    #
    # @param include_context [true, false]
    #   If set to true, the method will return +context, result+ instead of just the result (if an iteration
    #   results in a non-nil value, otherwise it will still return nil).
    #
    # @yield [context]
    #   callback to be run for the context and every fallback.
    #
    # @yieldparam context [Nii::Context]
    #
    # @yieldreturn [Object, nil]
    #   if nil is returned, the block will be called again with the context's {#fallback}.
    #
    # @return [Object, Array<Nii::Context, Object>, nil]
    #
    # @note
    #   This method is used internally by methods like {#find_message} and {#render}, but included
    #   in the public API to make it easier to build custom APIs on top of it.
    #
    #   Keep in mind that if you call a method like {#find_message} from within a block passed to
    #   {#with_fallbacks}, you do want to set the +use_fallbacks+ option on that method call to
    #   +false+.
    def with_fallbacks(use_fallback: true, include_context: false)
      context = self
      while context
        if result = yield(context)
          return result unless include_context
          return context, result
        else
          return unless use_fallback
          context = context.fallback_context
        end
      end
      nil
    end

    # List of locale to try in order to find and format a message
    # @api internal
    def lookup_chain = locale(true).lookup

    # @!attribute timezone
    #   @example
    #     context = Nii::Context.new('de-CH', timezone: 'CET')
    #     context.timezone # => #<Nii::Timezone:"Zurich, Switzerland">
    #
    #     Time.at 1_000_000_000, in: context.timezone # => 2001-09-09 03:46:40 +0200
    #     Time.now.localtime context.timezone         # Current time in CET
    #   @return [Nii::Timezone]
    def timezone
      @timezone ||= begin
        tz_name = locale_config.timezone || locale.timezone
        tz_name ? Timezone.new(tz_name, territory, config) : Timezone.current(config)
      end
    end

    # Allows pattern matching based on locale.
    #
    # @example
    #   context = Nii::Context.new :en
    #
    #   context in Nii::Context(Nii::Locale(/^en/)) # => true
    #   context in Nii::Context({language: 'en'})   # => true
    #
    # @return [Array<Nii::Locale>]
    def deconstruct = [locale]

    # Allows pattern matching on various attributes (see {DECONSTRUCT_KEYS} for the full list).
    #
    # @example
    #   context = Nii::Context.new "en-US"
    #   context in Nii::Context(currency: Nii::Currency("USD")) # => true
    #
    # @return [Hash]
    def deconstruct_keys(keys)
      keys = keys ? keys & DECONSTRUCT_KEYS : DECONSTRUCT_KEYS
      keys.inject({}) { _1.merge! _2 => public_send(_2) }.transform_values do |value|
        next value unless value.is_a? Hash
        value.transform_values { _1.to_sym }
      end
    end

    # @return [self]
    def to_nii_context = self

    # @private
    def inspect
      elements = [self.class.inspect, locale || locale_preference.locales.join(',')]
      elements << variables.inspect if variables.any?
      "#<#{elements.join(':')}>"
    end

    # @api internal
    def locale_data(*keys) = config.data.locale_data(data_locale, *keys)

    private

    # Retrieves an info object for this context.
    #
    # @overload grammar
    #   @example (see Nii::Info::Grammar)
    #   @return [Nii::Info::Grammar]
    #
    # @overload html
    #   @example (see Nii::Info::HTML#escape)
    #   @return [Nii::Info::HTML]
    #
    # @overload html(template, *values)
    #   @example (see Nii::Info::HTML#insert)
    #   @param   (see Nii::Info::HTML#insert)
    #   @return  (see Nii::Info::HTML#insert)
    #
    # @overload measurement_system
    #   @return [Nii::Info::MeasurementSystem]
    #
    # @overload numbers
    #   @return [Nii::Info::Numbers]
    #
    # @overload text
    #   @return [Nii::Info::Text]
    #
    # @overload time
    #   @return [Nii::Info::Time]
    #
    # @overload time(*args)
    #   @example (see Nii::Info::Time#local)
    #   @param   (see Nii::Info::Time#local)
    #   @return  (see Nii::Info::Time#local)
    #   @see Nii::Timezone#local
    #
    # @!visibility public
    # @return [Nii::Info::Generic]
    def method_missing(method, *arguments, **options, &block)
      return super unless info = @info[method] ||= Info[method, data_locale(true)]&.new(self)
      if arguments.any? or options.any?
        raise ArgumentError, "wrong number of arguments (given #{arguments.size}, expected 0)" unless info.respond_to? :[]
        info = info[*arguments, **options]
      end
      info
    end

    # @see method_missing
    def respond_to_missing?(method, include_private = false)
      @info.include?(method.to_sym) || super
    end

    # Resolves implicit object conversion before formatting a value.
    # It will for instance call #to_str on an object that implements it but isn't a String.
    # This way something like ActiveSupport::SafeBuffer stays an ActiveSupport::SafeBuffer.
    # @see IMPLICIT_CONVERSION
    def prepare_format(value)
      return value.name if value.is_a? Symbol
      IMPLICIT_CONVERSION.inject(value) do |value, (method, type)|
        next value unless value.respond_to? method
        type === value ? value : value.public_send(method)
      end
    end

    # called by all methods that might change the outcome of locale negotiation
    def reset_locale(locale = nil, force = false)
      return if explicit_locale? and !force
      @locale        = locale
      @territory     = nil
      @data_locale   = nil
      @locale_config = nil
      @timezone      = nil
      @currency      = nil
      @info          = {}
    end

    # perform locale negotiation
    # @see #locale
    def negotiate_locale(force)
      return unless lookup or force
      preference  = locale_preference
      preference &= available_locales if available_locales
      @locale     = preference.first || config.fallback_locales&.first || config.fallback_locale || Nii::Locale.root
      normalize_locale
      @locale
    end

    # normalize and validate the locale
    def normalize_locale
      return unless @locale
      alias_for = config.data.resolve_alias(locale)
      @locale   = Locale.parse(alias_for) if alias_for and alias_for != locale
      
      normalized = {
        territory: territory.known? ? territory.code : nil,
        # todo: script etc
      }

      normalized.delete_if { |key, value| @locale[key] == value }
      reset_locale(@locale.with(**normalized)) if normalized.any?
    end
  end
end
