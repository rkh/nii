# frozen_string_literal: true

module Nii::Lookup
  # @abstract Superclass for message lookup implementations.
  #   Inheriting from Common is optional, but any class that doesn't needs to implement all public methods of this class.
  #   Any subclass will need to implement the private methods {#lookup}, {#load_namespace}, and {#scan_locales}.
  #
  # @see Nii::Lookup::Default
  class Common
    # @return [Nii::Config]
    attr_reader :config

    def initialize(config)
      @config            = Nii::Config.new(config)
      @config            = Nii::Config.new(config.lookup) if @config.lookup
      @namespaces        = Concurrent::Map.new
      @lock              = Concurrent::ReadWriteLock.new
      @available_locales = nil
      setup
    end

    # @return [Nii::Message, nil]
    def find(locale, message, default_namespace: nil, namespace: default_namespace)
      namespace = normalize_namespace(namespace, message)
      return message.to_nii_template if message.respond_to? :to_nii_template
      return unless matches?(locale, namespace, message)
      
      locale_store  = @namespaces.fetch_or_store(locale.to_s) { Concurrent::Map.new }
      stored_object = locale_store.fetch_or_store(namespace) { load_namespace(locale, namespace) }
      lookup(stored_object, message) if stored_object
    end

    # @return [Nii::LocalePreference]
    def available_locales(cache = !config.reload_templates?)
      return @lock.with_read_lock { @available_locales ||= available_locales(false) } if cache
      Nii::LocalePreference.new(config.locale || scan_locales.compact.map(&:to_s))
    end

    def matches?(locale, namespace, message)
      matches_locale?(locale) and matches_namespace?(namespace) and matches_message?(message)
    end

    def matches_locale?(locale)
      available_locales.locales.include? locale
    end

    def matches_namespace?(namespace)
      return true unless prefix = normalize_namespace(config.namespace)
      namespace == prefix or namespace.start_with? "#{prefix}/"
    end

    def matches_message?(message)
      true
    end

    # @return [Nii::Namespace]
    def namespace(name)
      Nii::Namespace.new(self, name)
    end

    # @return [void]
    def reset
      @lock.with_write_lock do
        @namespaces.clear
        @available_locales = nil
        reset!
      end
    end

    # @return [self]
    def to_nii_lookup
      self
    end

    private

    def remove_prefix(namespace)
      return namespace unless namespace &&= normalize_namespace(namespace)
      return namespace unless prefix = normalize_namespace(config.namespace)
      return namespace if prefix == ''
      return ''        if namespace == prefix

      prefix = "#{prefix}/"
      namespace.sub(prefix, '') if namespace.start_with? prefix
    end

    def normalize_namespace(name, message = nil)
      name ||= message
      Nii::Utils.string(name) if name
    end

    def reset!
    end

    def setup
    end

    def lookup(stored_object, message)
      raise NotImplementedError, 'subclass responsibility'
    end

    def load_namespace(locale, namespace)
      raise NotImplementedError, 'subclass responsibility'
    end

    def scan_locales
      raise NotImplementedError, 'subclass responsibility'
    end
  end
end
