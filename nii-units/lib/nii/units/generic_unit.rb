# frozen_string_literal: true

module Nii::Units
  # @abstract
  class GenericUnit < Numeric
    # @api internal
    PATTERN = /\A([-\+]?[\d\.]+)\s*((?!\d)\S+)\Z/

    # @api internal
    CONSTANTS = {
      G:             '6.67408E-11'.to_r,
      PI:            Math::PI.to_r,
      ft2_to_m2:     0.3048r*0.3048r,
      ft3_to_m3:     0.3048r*0.3048r*0.3048r,
      ft_to_m:       0.3048r,
      gal_imp_to_m3: 0.00454609r,
      gal_to_m3:     231r*0.3048r*0.3048r*0.3048r/12r*12r*12r,
      glucose_molar_mass: 180.1557r,
      gravity:       9.80665r,
      in3_to_m3:     0.3048r*0.3048r*0.3048r/12r*12r*12r,
      item_per_mole: '6.02214076E+23'.to_r,
      lb_to_kg:      0.45359237r
    }

    # Struct to store division/multiplication rules.
    Rules = Struct.new(:divide, :multiply) do
      # @!attribute [rw] divide
      #   @return [Hash{Class => Class}]

      # @!attribute [rw] multiply
      #   @return [Hash{Class => Class}]

      # @private
      def initialize_copy(other)
        super
        other.divide   = other.divide&.dup
        other.multiply = other.multiply&.dup
      end

      # @private
      def resolve(value = self)
        case value
        when Rules  then Rules.new resolve(value.divide), resolve(value.multiply)
        when Hash   then resolve(value.to_a).to_h
        when Array  then value.map { resolve(_1) }
        when Symbol then Nii::Units.const_get(value)
        else value
        end
      end
    end

    # @api internal
    def self.aliases=(value)
      define_singleton_method(:aliases) { value }
    end
    self.aliases = {}

    # @!attribute [rw] aliases
    #   Unit aliases accepted by {#initialize}.
    #   Values should match the identifier used by Unicode for all known units.
    #
    #   @!scope class
    #   @return [Hash{String => String}]

    # @api internal
    def self.base_unit=(value)
      define_singleton_method(:base_unit) { value }
    end
    self.base_unit = 'generic'

    # @!attribute [rw] base_unit
    #   Base unit to be used for unit conversion.
    #   Should match the identifier used by Unicode for all known units.
    #
    #   @!scope class
    #   @return [String]

    # @api internal
    def self.units=(value)
      define_singleton_method(:units) { value }
    end
    self.units = {}

    # @!attribute [rw] units
    #   Supported units and their default options.
    #   Keys should match the identifier used by Unicode for all known units.
    #   Values have to be in the form accepted as options hash by {#initialize}.
    #
    #   @!scope class
    #   @return [Hash{String => Hash}]

    # @api internal
    def self.quantity=(value)
      define_singleton_method(:quantity) { value }
    end
    self.quantity = 'generic'

    # @!attribute [rw] quantity
    #   Unit quantity as understood by Unicode.
    #
    #   @example
    #     ElectricResistance.quantity # => "electric-resistance"
    #
    #   @!scope class
    #   @return [String]

    # Rule set to be used for determining result types for various arithmetic operations.
    # @return [Rules]
    def self.rules
      @rules ||= superclass.respond_to?(:rules) ? superclass.rules.dup : Rules.new({}, {})
    end

    # @overload [](input, **options)
    #   Creates a new instance based on an input string consisting of an amount and a unit string as one argument.
    #   @example
    #     mass = Mass['5 kg']
    #   @param input [String]
    #
    # @overload [](amount, unit, **options)
    #   Creates a new instance based on a numeric amount and a unit string as separate arguments.
    #   @example
    #     mass = Mass[5, 'kilogram']
    #   @param amount [Numeric]
    #   @param unit [String, Symbol]
    #
    # @return [GenericUnit]
    # @see #initialize
    def self.[](amount, unit = nil, **options)
      new(amount, unit, **options)
    end

    # @api internal
    def self.normalize_unit(unit) = aliases.fetch(unit&.to_s) { unit&.to_s&.downcase&.tr('_', '-') }

    # @return [true, false]
    def self.known_unit?(unit) = units.include?(normalize_unit(unit))

    # @api internal
    def self._load(data)
      amount, unit = data.split(':')
      new Rational(amount), unit
    end

    # @api internal
    def _dump(level) = "#{amount}:#{unit}"

    # @return [Rational] the amount in {#unit} units.
    attr_reader :amount

    # @return [String] the unit identifier.
    attr_reader :unit
    
    # @return [Rational] the amount in {#base_unit} units.
    attr_reader :base_amount
    
    # @return [String] the base unit identifier.
    attr_reader :base_unit
    
    # @return [Rules] Rule set to be used for determining result types for various arithmetic operations.
    attr_reader :rules
    
    # @return [Rational] Multiplication factor used for converting to and from the base unit.
    attr_reader :factor
    
    # @return [Rational] Offset between 0 units and 0 base units.
    attr_reader :offset
    
    # @return [String] Symbol to be used by {#to_s}.
    attr_reader :symbol
    
    # @return [Array<String>] list of measurement systems the unit belongs to. Empty for metric/SI units.
    attr_reader :systems

    # @param amount [String, Numeric, nil]
    #   String or number representing the amount, optionally including the unit type (will override unit parameter).
    #   Will be calculated based on +base_amount+ option if +nil+. Parsed and normalized numeric representation will be stored in {#amount}.
    #
    # @param unit [String, Symbol, nil]
    #   Unit to be used. Will default to the base unit if set to +nil+. Parsed and normalized String representation will be stored in {#unit}.
    #
    # @option options [Numeric] base_amount
    #   The amount converted to the quantity's base unit. Will be stored in {#base_amount}.
    #
    # @option options [Numeric] factor
    #   Factor for converting between base amount and amount.
    #   Setting this option will allow you to use unknown unit types. Will be stored in {#factor}.
    #
    # @option options [true, false] invert (false)
    #   Wheter or not the unit inversely proportional to its base unit. Accessible via {#inverse?}. Cannot be combined with +offset+.
    #
    # @option options [Numeric] offset (0)
    #   Offset for converting between base amount and amount.
    #   Setting this option in combination with +factor+ will allow you to use unknown unit types. Will be stored in {#offset}.
    #   Cannot be combined with +invert+.
    #
    # @option options [String] symbol
    #   Unit symbol to be used by {#to_s}. Will be stored in {#symbol}.
    #
    # @option options [String] system
    #   System string in BCP 47 extension format (valid options: +"ussystem"+, +"uksystem"+) if unit is not to be considered metric.
    #   Purely informative, has no further consequences. Will be stored in {#systems}.
    #
    # @option options [Array<String>] systems ([])
    #   Array of system strings if unit is not to be considered metric.
    #   Purely informative, has no further consequences. Will be stored in {#systems}.
    #
    # @note It is not recommended to pass both +amount+ and and the +base_amount+ option. You can still do so to reduce computation,
    #   but if they don't match properly, the resulting behavior is undefined.
    def initialize(amount, unit = nil, **options)
      if amount.is_a? String and amount =~ PATTERN
        amount, unit = $1, $2
      end

      @base_unit = self.class.base_unit
      @rules     = self.class.rules.resolve
      @unit      = self.class.normalize_unit(unit) || @base_unit
      unit_info  = self.class.units[@unit].to_h
      @systems   = []
      @offset    = 0r
      @invert    = false
      
      unit_info.merge(options).each do |option, value|
        case option
        when :base_amount      then @base_amount = get_amount(value, @base_unit)
        when :factor           then @factor      = value.to_r
        when :offset           then @offset      = value.to_r
        when :system, :systems then @systems     = Array(value)
        when :symbol           then @symbol      = value.to_s
        when :invert           then @invert      = !!value
        else raise ArgumentError, "unsupported option: #{option.inspect}"
        end
      end

      raise ArgumentError, "unknown unit #{unit.inspect} for #{self.class.quantity}" unless @factor
      raise ArgumentError, 'need to specify amount' unless amount or base_amount
      
      @amount = get_amount(amount, @unit) if amount

      if inverse?
        raise ArgumentError, 'cannot combine offset with invert' if offset?
        raise ArgumentError, 'amount cannot be zero for inversible units' if @amount == 0 or @base_amount == 0
        @base_amount ||= factor / @amount
        @amount      ||= factor / @base_amount
      else
        @base_amount ||= @amount * factor + offset
        @amount      ||= (@base_amount - offset) / factor
      end
    end

    # Amount converted to {#base_unit}, but ignoring the #{offset}.
    #
    # On its own, this isn't useful (as this is technically wrong), but necessary to
    # make arithmetic operations work.
    #
    # @return [Rational]
    def base_delta
      base_amount - offset
    end

    # @return [true, false] Wheter or not the zero point differs from the base unit.
    # @note By default, this is only true for the {Temperature} units Fahrenheit and Celsius.
    def offset?
      offset != 0
    end

    # @return [true, false] Wheter or not the unit inversely proportional to its base unit.
    def inverse?
      @invert
    end

    # Options hash as passed to {#initialize}, normalized and expanded with default values for unit.
    # @return [Hash] options hash for {#initialize}
    def options
      { factor: factor, offset: offset, systems: systems, symbol: symbol, invert: inverse? }
    end

    # Converts to a given unit.
    #
    # @example Converting Celsius to Fahrenheit
    #   Temperature["40°C"].in(:fahrenheit) # => Temperature["104°F"]
    #   
    # @see #initialize
    # @raise [ArugmentError] if converting to the unit is not supported
    # @return [GenericUnit]
    def convert_to(unit, **options)
      return self if unit == self.unit and options.empty?
      self.class.new(nil, unit, base_amount: base_amount, **options)
    end

    alias_method :in, :convert_to

    # Shorthand for +unit.convert_to(unit.base_unit)+.
    # @return [GenericUnit]
    def to_base_unit(**options)
      self.class.new(base_amount, base_unit, **options)
    end

    # @!group Numeric Protocol

    # Implements Ruby's coercion mechanism.
    # @see https://docs.ruby-lang.org/en/3.0.0/Numeric.html#method-i-coerce Numeric#coerce
    # @return [Array<Numeric>]
    def coerce(other)
      if other.class == self.class
        other.unit == unit ? [other, self] : [other.in(base_unit), self.in(base_unit)]
      else
        other = other.base_amount if other.is_a? GenericUnit
        base_amount.coerce(other)
      end
    end

    # @return [GenericUnit] self
    def +@ = self

    # @return [GenericUnit] self with negative amount
    def -@ = self.class.new(-amount, unit, **options)

    # Performs addition: the class of the resulting object depends on the class of the argument,
    # as well as on its unit if it is a {GenericUnit}.
    #
    # @param other [Numeric]
    # @return [Numeric]
    def +(other)
      return coerce(other).inject(:+) unless other.is_a? GenericUnit

      if base_unit != other.base_unit
        raise TypeError, "cannot perform addtion with two values that do not share a base unit " \
          "(#{unit} is based on #{base_unit}, #{other.unit} is based on #{other.base_unit})"
      end

      if inverse? != other.inverse?
        raise TypeError, "cannot perform addition with an inversely proportional " \
          "and a proportinal unit (#{unit} vs #{other.unit}), explicitely convert them"
      end

      return self.class.new(amount + other.in(unit).amount, unit) if inverse?
      self.class.new(nil, unit, base_amount: base_amount + other.base_delta, **options)
    end

    # Performs substraction: the class of the resulting object depends on the class of the argument,
    # as well as on its unit if it is a {GenericUnit}.
    #
    # @param other [Numeric]
    # @return [Numeric]
    def -(other)
      self + -other
    end

    # Performs division: the class of the resulting object depends on the class of the argument,
    # as well as on its unit if it is a {GenericUnit}.
    #
    # @param other [Numeric]
    # @return [Numeric]
    def /(other)
      return self.class.new(amount / other, unit, **options) if other.is_a? Integer
      return self.in(base_unit) * other if inverse?
      if result_type = rules.divide[other.class]
        result_type.new(to_r / other.to_r)
      else
        other, me = coerce(other)
        other.is_a?(Float) ? me.to_f / other : me.to_r / other.to_r
      end
    end

    # Performs multiplication: the class of the resulting object depends on the class of the argument,
    # as well as on its unit if it is a {GenericUnit}.
    #
    # @param other [Numeric]
    # @return [Numeric]
    def *(other)
      return self.class.new(amount * other, unit, **options) if other.is_a? Integer
      return other / self.in(base_unit) if inverse?
      if result_type = rules.multiply[other.class]
        result_type.new(to_r * other.to_r)
      else
        other, me = coerce(other)
        other.is_a?(Float) ? me.to_f * other : me.to_r * other.to_r
      end
    end

    # Raises the value to the power of +other+, which may be negative or fractional.
    #
    # @param other [Numeric]
    # @return [Integer, Float, Rational, Complex, GenericUnit]
    def **(other)
      case other
      when 1 then self
      when 2 then self * self
      when 3 then self * self * self
      else base_amount ** other
      end
    end

    # Returns the smallest value with the same unit and an amount greater than or equal
    # to it with a precision of +digits+ decimal digits (default: 0).
    #
    # @param digits [Integer]
    # @return [GenericUnit]
    def ceil(digits = 0)
      self.class.new(amount.ceil(digits), unit)
    end

    # Returns the largest value with the same unit and an amount less than or equal
    # to it with a precision of +digits+ decimal digits (default: 0).
    #
    # @param digits [Integer]
    # @return [GenericUnit]
    def floor(digits = 0)
      self.class.new(amount.floor(digits), unit)
    end

    # Rounds to the nearest value with the same unit with a precision of +digits+ decimal digits (default: 0).
    #
    # @param digits [Integer]
    # @return [GenericUnit]
    def round(digits = 0)
      self.class.new(amount.round(digits), unit)
    end

    # Returns the base amount as a rational. You can pass an optional argument +eps+ to find a similar
    # approximation with at most a delta of +eps+ between the approximation and the original value.
    #
    # @return [Rational]
    def rationalize(eps = nil)
      eps ? base_amount.rationalize(eps) : base_amount.rationalize
    end

    # Returns -1, 0, or +1 depending on whether the base_amount is less than, equal to, or greater than numeric.
    # +nil+ is returned if the two values are incomparable.
    #
    # @see https://docs.ruby-lang.org/en/3.0.0/Comparable.html Comparable
    # @return [Integer, nil]
    def <=>(other)
      return base_amount <=> other unless other.is_a? GenericUnit
      return if base_unit != other.base_unit

      if inverse?
        return unless other.inverse?
        other.base_amount <=> base_amount
      else
        return if other.inverse?
        base_amount <=> other.base_amount
      end
    end

    def deconstruct = [amount, unit]

    def deconstruct_keys(keys)
      keys ||= %i[amount unit]
      keys.inject({}) do |hash, key|
        if    key =~ /^in_(.+)$/ then hash.merge! key => self.in($1).amount
        elsif respond_to? key    then hash.merge! key => public_send(key)
        else  hash
        end
      end
    end

    # @return [BigDecimal] {#base_amount} converted into an BigDecimal
    def to_d = base_amount.to_d

    # @return [Float] {#base_amount} converted into an Float
    def to_f = base_amount.to_f

    # @return [Integer] {#base_amount} converted into an Integer
    def to_i = base_amount.to_i

    # @return [Rational] {#base_amount} converted into an Rational
    def to_r = base_amount.to_r

    # @return [String]
    def to_s
      return "#{to_num} #{unit}" unless symbol
      symbol =~ /^[A-z]/ ? "#{to_num} #{symbol}" : "#{to_num}#{symbol}"
    end

    # @!endgroup

    # Converts the amount to a float or an integer, depending on whether it equals a full number or not.
    #
    # @example
    #   Mass['5.0 kg'].to_num # => 5
    #   Mass['5.5 kg'].to_num # => 5.5
    #
    # @note This method is meant for display purposes and thus differs from other conversion methods like {#to_i}
    #   by using the amount, rather than the base amount. You should use a different method for calculations.
    #
    # @return [Integer, Float]
    def to_num
      amount == amount.to_i ? amount.to_i : amount.to_f
    end

    # @private
    def inspect
      if class_name = self.class.name
        short_name  = class_name[/[^\:]+$/]
        class_name  = short_name if Object.const_defined?(short_name) and Object.const_get(short_name) == self.class
      else
        class_name = self.class.inspect
      end

      "#{class_name}[#{to_s.inspect}]"
    end

    private

    def get_amount(amount, unit)
      return amount.to_r unless amount.is_a? GenericUnit
      amount.in(unit).amount
    end
  end
end
