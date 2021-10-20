# frozen_string_literal: true
require 'active_model/type'

module Nii::Rails
  module Types
    class Generic < ActiveModel::Type::Value
      def serialize(value) = cast(value)&.code

      def cast(value)
        return unless value
        self.class.factory[value]
      rescue ArgumentError
      end
    end

    class LocaleMap < ActiveModel::Type::Value
      attr_reader :type

      def initialize(type: nil, **options)
        case @type = type&.to_sym
        when :json   then @base_type = ActiveModel::Type::JSON.new
        when :hstore then @base_type = ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Hstore.new
        when :jsonb  then @base_type = ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Jsonb.new
        when nil     then raise ArgumentError, 'type is required'
        else raise ArgumentError, "Unsupported type: #{type.inspect}"
        end
        super(**options)
      end

      def cast(value)
        value = @base_type.deserialize(value) if value.is_a?(::String)
        value = Nii::LocaleMap.new(value) unless value.is_a?(Nii::LocaleMap)
        value
      end

      def serialize(value)
        value = value.to_h if value.is_a?(Nii::LocaleMap)
        @base_type.serialize(value)
      end

      def changed_in_place?(raw_old_value, new_value) = deserialize(raw_old_value) != new_value
    end

    AVAILBALE = %i[ currency locale territory timezone locale_map ].freeze
    ALIASES   = { language: :locale, region: :territory, country: :territory, time_zone: :timezone }.freeze
    ALL_TYPES = AVAILBALE + ALIASES.keys
    TYPES     = { locale_map: LocaleMap }
    private_constant :AVAILBALE, :ALIASES, :ALL_TYPES, :TYPES, :Generic, :LocaleMap

    extend self

    def register(*types, on: nil, prefix: nil)
      if on.nil?
        register(*types, prefix: prefix, on: ActiveRecord::Type) if defined? ActiveRecord::Type
        register(*types, prefix: prefix, on: ActiveModel::Type)  if defined? ActiveModel::Type
      else
        types = ALL_TYPES if types.empty?
        Array(on).each do |registry|
          types.each do |type|
            prefixed = prefix ? :"#{prefix}_#{type}" : type
            registry.register(prefixed, self[type])
          end
        end
      end
    end

    # @param [Symbol] type
    # @return [Class] subclass fo ActiveModel::Type::Value
    def [](key) = TYPES[key] ||= build(key)

    private

    def build(key)
      raise ArgumentError, "Unknown type: #{key}" unless ALL_TYPES.include?(key)
      type    = ALIASES.fetch(key, key)
      factory = Nii.const_get(type.capitalize, false)
      Class.new(Generic) do
        define_singleton_method(:inspect) { "Nii::Rails::Types[#{type.inspect}]" }
        define_singleton_method(:factory) { factory }
      end
    end
  end
end
