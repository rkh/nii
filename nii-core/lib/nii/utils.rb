# frozen_string_literal: true

module Nii
  # @api internal
  module Utils
    # Typically used to remove the lock on a frozen object.
    module DummyLock
      extend self
      def with_read_lock  = yield
      def with_write_lock = yield
    end

    module WarningFilter
      PATH_FILTER = %r{lib/nii/\S+\.rb:\d+: warning: (.+)$}
      IGNORE      = []
      private_constant :PATH_FILTER, :IGNORE

      def self.ignore?(message) = message =~ PATH_FILTER && ignore.any? { $1.include? _1 }
      def self.ignore(*values)  = values.any? ? IGNORE.concat(values).uniq! : IGNORE
      def warn(message, **)     = WarningFilter.ignore?(message) || super

      Warning.extend(self)
    end

    INTEGERS   = 1.to_s.frozen? ? [] : (0..1000).map { |i| i.to_s.freeze }
    IS_UNICODE = { Encoding::GB18030 => true, Encoding::ASCII => true }
    private_constant :IS_UNICODE, :INTEGERS

    extend self

    # Recursively freezes Hashes and Arrays.
    # @param object [Object]
    # @return [Object] the object passed as argument
    def deep_freeze(object)
      return object.deep_freeze if object.respond_to? :deep_freeze and not object.is_a? Utils
      return object unless object.respond_to? :freeze
      return object if object.frozen?

      case object
      when Array, Set
        object.each { |value| deep_freeze(value) }
      when Hash
        object.each_value { |value| deep_freeze(value) }
        object.each_key   { |value| deep_freeze(value) }
      end
      
      object.freeze
    end

    def type(klass)
      return unless klass.respond_to? :name and name = klass.name
      @type       ||= {}
      @type[name] ||= name[/[^:]+$/].split(/(?<=[a-z])(?=[A-Z])/).join('_').downcase.to_sym
    end

    # Recursively merges two Hashes. Mainly used for Ruby I18n compatibility, which heavily relies on deep merging.
    def deep_merge(first, second)
      return first if second.nil?
      return second unless first.is_a? Hash and second.is_a? Hash
      first.merge(second) { deep_merge(_2, _3) }
    end

    # Converts a value into a string, but avoids the additional allocation of #to_s if possible.
    # @param value [#to_s]
    # @return [String]
    def string(value)
      value = value.untagged if value.is_a? Parser::YAML::Tagged
      case value
      when Symbol   then value.name
      when String   then value
      when Integer  then (value >= 0 && INTEGERS[value]) || value.to_s
      when Pathname then value.instance_variable_get(:@path).freeze
      else value.to_s
      end
    end

    # Converts a value into a symbol, even if it doesn't implement #to_sym.
    # @param value [#to_sym, #to_s]
    # @return [Symbol]
    def symbol(value)
      return value if value.is_a? Symbol
      value = string(value) unless value.respond_to? :to_sym
      value.to_sym
    end

    # @!method class_name(mod)
    #   Same as Module#name, but ignores any overrides the module might have made.
    #   @param mod [Module, Class]
    #   @return [String, nil]
    define_method(:class_name, &::Module.instance_method(:name).method(:bind_call))

    # @example
    #   Nii::Utils.is_unicode? "UCS-4LE" # => true
    #   Nii::Utils.is_unicode? "ASCII"   # => false
    #
    # @param encoding [Encoding, String]
    #
    # @return [true, false]
    #   Whether or not a string encoding is based on the Unicode standard.
    #   Relevant for normalization, collation, etc.
    def is_unicode?(encoding)
      encoding = Encoding.find(encoding) unless encoding.is_a? Encoding
      IS_UNICODE.fetch(encoding) { IS_UNICODE[encoding] = encoding.names.any? { |name| name.start_with? 'UTF-' } }
    end
  end
end
