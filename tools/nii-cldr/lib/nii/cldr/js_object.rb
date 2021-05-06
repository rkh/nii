# frozen_string_literal: true
module Nii::CLDR
  # Custom Hash wrapper to allow repeat keys in the JSON payload.
  class JSObject
    extend Forwardable
    attr_reader :data

    def initialize(data = {}) = @data = data

    def []=(key, value)
      value      = combine(@data[key], value) if @data.include? key
      @data[key] = value
    end

    def to_h(data = @data)
      case data
      when Array    then data.map { |e| to_h(e) }
      when Hash     then data.transform_values { |e| to_h(e) }
      when JSObject then data.to_h
      else data
      end
    end

    def inspect = "#<#{self.class.inspect}>"

    private

    def combine(first, second)
      raise ArgumentError, "cannot combine #{first.class} with #{second.class}" if first.class != second.class
      case first
      when Array    then first + second
      when Hash     then first.merge(second) { |key, a, b| combine(a, b) }
      when JSObject then JSObject.new combine(first.data, second.data)
      else raise ArgumentError, "cannot combine #{first.class}"
      end
    end
  end
end
