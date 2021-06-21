# frozen_string_literal: true

module Nii
  # Configuration objects used in various places.
  #
  # @note
  #   The configuration objects are immutable.
  #   This means that any object using them does not need to check them for changes.
  #
  # @example
  #   config = Config.new(foo: :bar)
  #   config.foo # => :bar
  #   config.bar # => nil
  #
  # @see Nii::Setup
  class Config
    REGISTER = {}
    private_constant :REGISTER

    # @api internal
    def self.extract(arguments)
      config    = Config.new
      arguments = arguments.reject do |argument|
        next unless argument.is_a? Hash or argument.respond_to? :to_nii_config
        config = config.merge(argument)
      end
      [ config, arguments ]
    end

    # @api internal
    def self.define(method)
      return if method_defined? method
      if method.end_with???
        key = Utils.string(method)[0..-2]
        prefix = "!!"
      else
        key = method
      end
      class_eval "def #{method} = #{prefix}@options[#{key.to_sym.inspect}]"
    end

    # @overload new(config)
    #   @param config [#to_nii_config, #to_h]
    #
    #   @return [Nii::Config, #to_nii_config, nil]
    #     the result of calling #to_nii_config on the argument (if it responds to it)
    #     a new Config instance based on the provided object otherwise.
    def self.new(*args)
      return @empty ||= super if args.size == 0 or args.size == 1 and args.first.nil?
      return args.first.to_nii_config if args.size == 1 and args.first.respond_to? :to_nii_config
      super
    end

    # @api internal
    def self.[](key)
      return REGISTER[key] if REGISTER.include? key or !key.is_a? Class
      return unless key = key.ancestors.detect { |a| REGISTER.include? a }
      REGISTER[key]
    end

    # @api internal
    def self.[]=(key, value)
      return REGISTER.delete(key) unless value
      REGISTER[key] = new(value)
    end

    # @api internal
    def initialize(config = {})
      @options = config.to_h.transform_keys(&:to_sym).transform_values do |value|
        next value unless value.is_a? Hash and value.keys.all? { |k| k.is_a? Symbol}
        Nii::Config.new(value)
      end.freeze
    end

    # @api internal
    def data = @options[:data] || Nii::DATA

    # @api internal
    # @return [self]
    def for(locale)
      self
    end

    # @api internal
    # @return [true]
    def applies_for?(locale) = true

    # @api internal
    # @return [true, false]
    def empty? = @options.empty?

    # Allows accessing nested values. Similar to Hash#dig.
    # Will work with further Config instances or Hash values.
    #
    # @example
    #   config = Nii::Config.new(a: Config.new(b: {c: 42}))
    #   config.dig(:a, :b, :c) # => 42
    #   config.dig(:a, :c, :b) # => nil
    #
    # @return [Object, nil]
    def dig(key, *keys)
      value = @options[key.to_sym]
      value &&= value.dig(*keys) if keys.any?
      value
    end

    def deconstruct_keys(keys) = @options

    # Mimics Hash#except.
    # @param keys [Array<Symbol>] keys to exclude
    def except(*keys)
      return self unless keys.any? { |k| @options.include? k }
      Nii::Config.new(@options.except(*keys))
    end

    # @return [Hash] a hash representation of the config
    def to_h(recursive = true)
      return @options.dup unless recursive
      unless recursive.respond_to? :call
        recursive = -> value do
          case value
          when Hash   then value.transform_values(&recursive)
          when Array  then value.map(&recursive)
          when Config then value.to_h(recursive)
          else value
          end
        end
      end
      recursive.call(@options)
    end

    alias_method :to_hash, :to_h

    # @return [self]
    def to_nii_config
      self
    end

    # Merges config with +other+, prefering values from the other config over its own values.
    # @note This calls {#reverse_merge} on +other+ if it is a subclass of Config.
    # @param other [Hash, Config, to_nii_config, to_h]
    def merge(other)
      return Nii::Config.new(other) if empty?
      combine(other, :reverse_merge) { |o| @options.merge(o) }
    end

    # Merges config with +other+, prefering its own values values over values from the other config.
    # @note This calls {#merge} on +other+ if it is a subclass of Config.
    # @param other [Hash, Config, to_nii_config, to_h]
    def reverse_merge(other)
      return Nii::Config.new(other) if empty?
      combine(other, :merge) { |o| o.merge(@options) }
    end

    # @!method [](key)
    #   Hash like access to configuration options.
    alias_method :[], :public_send

    # @overload slice(*keys)
    #   Hash#slice for Config objects.
    #   @return [Nii::Config]
    def slice(...) = Config.new(@options.slice(...))

    # @overload except(*keys)
    #   Hash#except for Config objects.
    #   @return [Nii::Config]
    def except(...) = Config.new(@options.except(...))

    # @api internal
    def hash = @options.hash
    
    # @api internal
    def ==(other)
      return false unless other.class == self.class
      @options == other.to_h(false)
    end

    alias_method :eql?, :==

    private

    def combine(other, fallback)
      other = other.to_nii_config if other.respond_to? :to_nii_config
      return other.public_send(fallback, self) if self.class > other.class
      self.class.new yield(other.to_h)
    end

    # Any unknown method will be treated as a configuration option.
    def method_missing(method, *arguments, &block)
      return super unless access_method? method
      Nii::Config.define(method)
      send(method, *arguments, &block)
    end

    def access_method?(method)
      return false if method.end_with?   '='
      return false if method.start_with? '_'
      return false unless method =~ /^\w+\??$/
      not method.start_with?('to_')
    end

    def respond_to_missing?(method, include_private = false)
      access_method?(method) or super
    end
  end
end
