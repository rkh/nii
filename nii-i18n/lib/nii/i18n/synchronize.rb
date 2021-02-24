# frozen_string_literal: true

module Nii::I18n
  # Tool to synchronize a given Nii::Context object with I18n.locale.
  # On activation, it will set I18n.locale, subsequent changes to I18n.locale will be propagated back
  # to the context and vice versa.
  #
  # Also makes I18n somewhat thread-safe as a side product (load path changes are still not thread-safe,
  # but it's not up to Nii to fix this).
  #
  # @example Enabling synchronization for a given block
  #   context = Nii::Context.new
  #
  #   Nii::I18n.synchronize(context) do
  #     # Synchronize I18n → Nii
  #     I18n.locale = 'de-DE'
  #     context.locale # => #<Nii::Locale:de-DE>
  #
  #     # Synchronize Nii → I18n
  #     context.locale = Nii::Locale.new(language: 'en', region: 'US')
  #     I18n.locale # => 'en-US'
  #   end
  #
  # @example Enabling synchronization for the thread
  #   context = Nii::Context.new('de-DE')
  #
  #   # Synchronize Nii → I18n
  #   Nii::I18n.synchronize(context)
  #   I18n.locale # => 'de-DE'
  #
  #   # Synchronize I18n → Nii
  #   I18n.locale = 'en-US'
  #   context.locale # => #<Nii::Locale:en-US>
  #
  # @example Temporarility disabling synchronization
  #   context = Nii::Context.new
  #   sync    = Nii::I18n::Synchronize.new(context)
  #
  #   sync.enable do
  #     I18n.locale = 'de-DE'
  #
  #     sync.enabled?  # => true
  #     I18n.locale    # => 'de-DE'
  #     context.locale # => 'de-DE'
  #
  #     sync.disable do
  #       I18n.locale = 'en-US'
  #       sync.enabled?  # => false
  #       I18n.locale    # => 'en-US'
  #       context.locale # => 'de-DE'
  #     end
  #
  #     sync.enabled?  # => true
  #     I18n.locale    # => 'de-DE'
  #     context.locale # => 'de-DE'
  #   end
  class Synchronize
    # @api internal
    def self.delegate(*methods, setter: true)
      methods.each do |method|
        class_eval "def #{method} = @lock.with_read_lock { @i18n.#{method} }"
        class_eval "def #{method}(value) @lock.with_write_lock { @i18n.#{method} = value }; end" if setter
      end
    end

    delegate :backend, :default_locale, :available_locales, :default_separator, :exception_handler,
      :missing_interpolation_argument_handler, :load_path, :enforce_available_locales, :interpolation_patterns

    delegate :available_locales_set, :available_locales_initialized?, setter: false

    # @param context [Nii::Context]
    def initialize(context)
      @context = Nii::Context.new(context)
      @i18n    = I18n::Config.new
      @lock    = Concurrent::ReadWriteLock.new
    end

    # Synchronzies I18n.locale and context.locale.
    # Synchronization is thread-local (ie, new threads spawned will disregard the locale).
    #
    # @overload enable
    #   Enables synchronization for the passed block.
    #   @yield Block that will be executed with synchronization enabled.
    #   @return [Object] return value of the passed block
    #
    # @overload enable
    #   Enables synchronization for the current thread.
    #   @return [nil]
    def enable(&block) = with_confg(self,  &block)

    # Desynchronzies I18n.locale and context.locale.
    # Desynchronization is thread-local (ie, new threads spawned will disregard the locale).
    #
    # @overload enable
    #   Disables synchronization for the passed block.
    #   @yield Block that will be executed with synchronization enabled.
    #   @return [Object] return value of the passed block
    #
    # @overload enable
    #   Disables synchronization for the current thread.
    #   @return [nil]
    def disable(&block) = with_confg(@i18n, &block)

    # Whether or not this synchronization is enabled.
    # Note that another synchronization might be active instead.
    #
    # @return [true, false]
    def enabled? = Thread.current[:i18n_config] == self

    # Will be called by I18n.locale if synchroniztion is enabled.
    # @api internal
    def locale = @lock.with_read_lock { @context.locale(true).code }
    
    # Will be called by I18n.locale= if synchroniztion is enabled.
    # @api internal
    def locale=(value)
      @lock.with_write_lock { @i18n.locale = @context.locale = value }
    end

    # @return [Nii::Context]
    def to_nii_context = @context

    # @return [Nii::Config]
    def to_nii_config = @context.config

    private

    # Sets Thread.current[:i18n_config] (and resets it to its previous value when called with a block).
    def with_config(config)
      config_was, Thread.current[:i18n_config] = Thread.current[:i18n_config], config
      yield if block_given?
    ensure
      Thread.current[:i18n_config] = config_was if block_given?
    end
  end
end
