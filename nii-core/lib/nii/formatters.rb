# frozen_string_literal: true

module Nii
  module Formatters
    autoload :ActiveSupport, 'nii/formatters/active_support'
    autoload :Array,         'nii/formatters/array'
    autoload :Concurrent,    'nii/formatters/concurrent'
    autoload :Date,          'nii/formatters/date'
    autoload :Hash,          'nii/formatters/hash'
    autoload :Money,         'nii/formatters/money'
    autoload :Nii,           'nii/formatters/nii'
    autoload :Numeric,       'nii/formatters/numeric'
    autoload :String,        'nii/formatters/string'
    autoload :Time,          'nii/formatters/time'
    autoload :TZInfo,        'nii/formatters/tzinfo'

    Set = Array

    extend self
  
    # @api internal
    def [](klass, config = nil, cache = true)
      if config&.formatters
        override = config.fromatters[klass]
        return override if override
      elsif cache
        return @register[klass] ||= self[klass, nil, false]
      else
        return klass.to_nii_formatter if klass.respond_to? :to_nii_formatter
      end

      case klass
      when ::String then @register[klass] ||= resolve(klass)
      when ::Class  then self[::Nii::Utils.class_name(klass), config] ||= self[klass.superclass]
      when ::Symbol then self[klass.name, config]
      when nil
      end
    end

    # @api internal
    def []=(klass, config = nil, value)
      klass = ::Nii::Utils.class_name(klass) || klass if klass.is_a? Module
      klass = ::Nii::Utils.string(klass)

      return if klass == ''
      @register[klass] = value
    end

    private

    def resolve(name)
      formatter = name.split('::').inject(self) do |namespace, constant|
        next namespace.const_get(constant) if namespace.const_defined? constant, false
        constant == 'Generic' ? namespace : return
      end

      formatter = formatter.respond_to?(:new) ? formatter.new : formatter
      formatter if formatter.respond_to? :format
    end

    @register = {}
  end
end
