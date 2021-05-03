# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent temperature values.
  # 
  # Supported Units:
  # * +celsius+
  # * +fahrenheit+
  # * +kelvin+ (base unit)
  class Temperature < GenericUnit
    self.quantity  =  'temperature'
    self.base_unit =  'kelvin'
    self.units     =  {
      'celsius'    => { offset: 273.15r, factor: 1 },
      'fahrenheit' => { factor: 5r/9r, offset: 2298.35r/9r, systems: ["ussystem", "uksystem"] },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Temperature }
    rules.multiply =  { Portion => Temperature }

    # Converts the object to degrees Celsius.
    # @return [Temperature] the equivalent instance in degrees Celsius
    def to_celsius(**options) = convert_to('celsius', **options)

    # Whether or not amount is in degrees Celsius.
    # @return [true, false]
    def celsius? = unit == 'celsius'

    # Converts the object to degrees Fahrenheit.
    # @return [Temperature] the equivalent instance in degrees Fahrenheit
    def to_fahrenheit(**options) = convert_to('fahrenheit', **options)

    # Whether or not amount is in degrees Fahrenheit.
    # @return [true, false]
    def fahrenheit? = unit == 'fahrenheit'

    # Converts the object to kelvins.
    # @return [Temperature] the equivalent instance in kelvins
    def to_kelvin(**options) = convert_to('kelvin', **options)

    # Whether or not amount is in kelvins.
    # @return [true, false]
    def kelvin? = unit == 'kelvin'

    # @return [Temperature] self
    def to_temperature = self
  end
end
