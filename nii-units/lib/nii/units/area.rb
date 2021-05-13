# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent area values.
  # 
  # Supported Units:
  # * +acre+
  # * +dunam+
  # * +hectare+
  # * +square-meter+ (base unit)
  # * +square-inch+
  # * +square-centimeter+
  # * +square-foot+
  # * +square-kilometer+
  # * +square-mile+
  # * +square-yard+
  class Area < GenericUnit
    self.quantity         =  'area'
    self.base_unit        =  'square-meter'
    self.units            =  {
      'acre'              => { factor: CONSTANTS[:ft2_to_m2]*43560r, systems: ["ussystem", "uksystem"] },
      'dunam'             => { factor: 1000 },
      'hectare'           => { factor: 10000, systems: ["metric"] },
      'square-centimeter' => { systems: ["metric", "si"], factor: 1r/100r*1r/100r },
      'square-foot'       => { factor: CONSTANTS[:ft_to_m]*CONSTANTS[:ft_to_m], systems: ["ussystem", "uksystem"] },
      'square-inch'       => { factor: CONSTANTS[:ft_to_m]/12r*CONSTANTS[:ft_to_m]/12r, systems: ["ussystem", "uksystem"] },
      'square-kilometer'  => { systems: ["metric", "si"], factor: 1000r*1000r },
      'square-mile'       => { factor: CONSTANTS[:ft_to_m]*5280r*CONSTANTS[:ft_to_m]*5280r, systems: ["ussystem", "uksystem"] },
      'square-yard'       => { factor: CONSTANTS[:ft_to_m]*3r*CONSTANTS[:ft_to_m]*3r, systems: ["ussystem", "uksystem"] },
      base_unit           => { factor: 1 }}
    self.aliases          =  {}
    rules.divide          =  { :Portion => :Area, :Length => :Length }
    rules.multiply        =  { :Portion => :Area, :CurrentDensity => :ElectricCurrent, :Illuminance => :LuminousIntensity, :Length => :Volume, :PressurePerLength => :Pressure }

    # Converts the object to acres.
    # @return [Area] the equivalent instance in acres
    def to_acre(**options) = convert_to('acre', **options)

    # Whether or not amount is in acres.
    # @return [true, false]
    def acre? = unit == 'acre'

    # Converts the object to dunams.
    # @return [Area] the equivalent instance in dunams
    def to_dunam(**options) = convert_to('dunam', **options)

    # Whether or not amount is in dunams.
    # @return [true, false]
    def dunam? = unit == 'dunam'

    # Converts the object to hectares.
    # @return [Area] the equivalent instance in hectares
    def to_hectare(**options) = convert_to('hectare', **options)

    # Whether or not amount is in hectares.
    # @return [true, false]
    def hectare? = unit == 'hectare'

    # Converts the object to square meters.
    # @return [Area] the equivalent instance in square meters
    def to_square_meter(**options) = convert_to('square-meter', **options)

    # Whether or not amount is in square meters.
    # @return [true, false]
    def square_meter? = unit == 'square-meter'

    # Converts the object to square inches.
    # @return [Area] the equivalent instance in square inches
    def to_square_inch(**options) = convert_to('square-inch', **options)

    # Whether or not amount is in square inches.
    # @return [true, false]
    def square_inch? = unit == 'square-inch'

    # Converts the object to square centimeters.
    # @return [Area] the equivalent instance in square centimeters
    def to_square_centimeter(**options) = convert_to('square-centimeter', **options)

    # Whether or not amount is in square centimeters.
    # @return [true, false]
    def square_centimeter? = unit == 'square-centimeter'

    # Converts the object to square feet.
    # @return [Area] the equivalent instance in square feet
    def to_square_foot(**options) = convert_to('square-foot', **options)

    # Whether or not amount is in square feet.
    # @return [true, false]
    def square_foot? = unit == 'square-foot'

    # Converts the object to square kilometers.
    # @return [Area] the equivalent instance in square kilometers
    def to_square_kilometer(**options) = convert_to('square-kilometer', **options)

    # Whether or not amount is in square kilometers.
    # @return [true, false]
    def square_kilometer? = unit == 'square-kilometer'

    # Converts the object to square miles.
    # @return [Area] the equivalent instance in square miles
    def to_square_mile(**options) = convert_to('square-mile', **options)

    # Whether or not amount is in square miles.
    # @return [true, false]
    def square_mile? = unit == 'square-mile'

    # Converts the object to square yards.
    # @return [Area] the equivalent instance in square yards
    def to_square_yard(**options) = convert_to('square-yard', **options)

    # Whether or not amount is in square yards.
    # @return [true, false]
    def square_yard? = unit == 'square-yard'

    # @return [Area] self
    def to_area = self
  end
end
