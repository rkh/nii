# frozen_string_literal: true

module Nii
  # Helper class to compile LDML/CLDR time patterns to Ruby code.
  class TimePattern
    # @return [String] the patttern
    attr_reader :pattern
    alias_method :to_s, :pattern

    # @return [String] Pattern as interpolated Ruby code
    # @api internal
    attr_reader :ruby

    # @return [Array<Symbol>] Fields used in the pattern
    attr_reader :fields

    # @param pattern [String]
    def initialize(pattern)
      tokens   = Nii::Parser.time_pattern(pattern)
      elements = tokens.map { _1.is_a?(String) ? _1.inspect[1..-2] : "#\{value.#{_1}\}" }
      @pattern = pattern.freeze
      @fields  = tokens.grep(Symbol).uniq
      @ruby    = %Q{"#{elements.join}"}

      singleton_class.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def format(value)
          #{@ruby}
        rescue NameError => error
          raise error unless fields.include?(error.name)
          raise ArgumentError, "missing value for \#{error.name}"
        end
      RUBY
    end

    # @!method format(value)
    #   @warn
    #     This method is generally not intended to be called directly.
    #     The value it expects is not a time or a date object.
    #     Use {Nii::Context#format} instead.
    #
    #   @example
    #     object  = OpenStruct.new(y: "2020", m: "02", d: "03")
    #     pattern = Nii::TimePattern.new("y-m-d")
    #     pattern.format(object) #=> "2020-02-03"
    #
    #   @return [String]
    #   @raise [ArgumentError] if the value doesn't implement a given field

    # @private
    def inspect = "#<#{self.class.inspect}:#{pattern.inspect}>"
  end
end
