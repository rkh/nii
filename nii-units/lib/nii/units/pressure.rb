# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent pressure values.
  # 
  # Supported Units:
  # * +atmosphere+
  # * +bar+
  # * +kilogram-per-meter-square-second+ (base unit)
  # * +pascal+
  # * +hectopascal+
  # * +kilopascal+
  # * +megapascal+
  # * +millibar+
  class Pressure < GenericUnit
    self.quantity   =  'pressure'
    self.base_unit  =  'kilogram-per-meter-square-second'
    self.units      =  {
      'atmosphere'  => { factor: 101325                             },
      'bar'         => { factor: 100000, systems: ["metric"]        },
      'hectopascal' => { systems: ["metric", "si"], factor: 100     },
      'kilopascal'  => { systems: ["metric", "si"], factor: 1000    },
      'megapascal'  => { systems: ["metric", "si"], factor: 1000000 },
      'millibar'    => { factor: 100000r/1000r, systems: ["metric"] },
      'pascal'      => { systems: ["metric", "si"], factor: 1       },
      base_unit     => { factor: 1                                  }}
    self.aliases    =  {}
    rules.divide    =  { Portion => Pressure, PressurePerLength => Area, Area => PressurePerLength }
    rules.multiply  =  { Portion => Pressure }

    # Converts the object to atmospheres.
    # @return [Pressure] the equivalent instance in atmospheres
    def to_atmosphere(**options) = convert_to('atmosphere', **options)

    # Whether or not amount is in atmospheres.
    # @return [true, false]
    def atmosphere? = unit == 'atmosphere'

    # Converts the object to bars.
    # @return [Pressure] the equivalent instance in bars
    def to_bar(**options) = convert_to('bar', **options)

    # Whether or not amount is in bars.
    # @return [true, false]
    def bar? = unit == 'bar'

    # Converts the object to pascals.
    # @return [Pressure] the equivalent instance in pascals
    def to_pascal(**options) = convert_to('pascal', **options)

    # Whether or not amount is in pascals.
    # @return [true, false]
    def pascal? = unit == 'pascal'

    # Converts the object to hectopascals.
    # @return [Pressure] the equivalent instance in hectopascals
    def to_hectopascal(**options) = convert_to('hectopascal', **options)

    # Whether or not amount is in hectopascals.
    # @return [true, false]
    def hectopascal? = unit == 'hectopascal'

    # Converts the object to kilopascals.
    # @return [Pressure] the equivalent instance in kilopascals
    def to_kilopascal(**options) = convert_to('kilopascal', **options)

    # Whether or not amount is in kilopascals.
    # @return [true, false]
    def kilopascal? = unit == 'kilopascal'

    # Converts the object to megapascals.
    # @return [Pressure] the equivalent instance in megapascals
    def to_megapascal(**options) = convert_to('megapascal', **options)

    # Whether or not amount is in megapascals.
    # @return [true, false]
    def megapascal? = unit == 'megapascal'

    # Converts the object to millibars.
    # @return [Pressure] the equivalent instance in millibars
    def to_millibar(**options) = convert_to('millibar', **options)

    # Whether or not amount is in millibars.
    # @return [true, false]
    def millibar? = unit == 'millibar'

    # @return [Pressure] self
    def to_pressure = self
  end
end
