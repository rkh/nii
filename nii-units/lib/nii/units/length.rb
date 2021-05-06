# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent length values.
  # 
  # Supported Units:
  # * +100-kilometer+
  # * +astronomical-unit+
  # * +earth-radius+
  # * +fathom+
  # * +foot+
  # * +furlong+
  # * +inch+
  # * +light-year+
  # * +meter+ (base unit)
  # * +mile+
  # * +mile-scandinavian+
  # * +nautical-mile+
  # * +parsec+
  # * +point+
  # * +solar-radius+
  # * +yard+
  # * +centimeter+
  # * +kilometer+
  # * +decimeter+
  # * +micrometer+
  # * +millimeter+
  # * +nanometer+
  # * +picometer+
  class Length < GenericUnit
    self.quantity         =  'length'
    self.base_unit        =  'meter'
    self.units            =  {
      '100-kilometer'     => { factor: 100000, systems: ["metric"] },
      'astronomical-unit' => { factor: 149597900000 },
      'centimeter'        => { systems: ["metric", "si"], factor: 1r/100r },
      'decimeter'         => { systems: ["metric", "si"], factor: 1r/10r },
      'earth-radius'      => { factor: '6.3781E6'.to_r },
      'fathom'            => { factor: CONSTANTS[:ft_to_m]*6r, systems: ["ussystem", "uksystem"] },
      'foot'              => { factor: CONSTANTS[:ft_to_m], systems: ["ussystem", "uksystem"] },
      'furlong'           => { factor: CONSTANTS[:ft_to_m]*660r, systems: ["ussystem", "uksystem"] },
      'inch'              => { factor: CONSTANTS[:ft_to_m]/12r, systems: ["ussystem", "uksystem"] },
      'kilometer'         => { systems: ["metric", "si"], factor: 1000 },
      'light-year'        => { factor: 9460730000000000 },
      'micrometer'        => { systems: ["metric", "si"], factor: 1r/1000000r },
      'mile'              => { factor: CONSTANTS[:ft_to_m]*5280r, systems: ["ussystem", "uksystem"] },
      'mile-scandinavian' => { factor: 10000, systems: ["metric"] },
      'millimeter'        => { systems: ["metric", "si"], factor: 1r/1000r },
      'nanometer'         => { systems: ["metric", "si"], factor: 1r/1000000000r },
      'nautical-mile'     => { factor: 1852, systems: ["ussystem", "uksystem"] },
      'parsec'            => { factor: 30856780000000000 },
      'picometer'         => { systems: ["metric", "si"], factor: 1r/1000000000000r },
      'point'             => { factor: CONSTANTS[:ft_to_m]/864r, systems: ["ussystem", "uksystem"] },
      'solar-radius'      => { factor: 695700000 },
      'yard'              => { factor: CONSTANTS[:ft_to_m]*3r, systems: ["ussystem", "uksystem"] },
      base_unit           => { systems: ["metric", "si"], factor: 1 }}
    self.aliases          =  {}
    rules.divide          =  { Portion => Length }
    rules.multiply        =  { Consumption => Volume, Portion => Length, CurrentDensity => MagneticFieldStrength, Force => Energy, Area => Volume, Length => Area, MagneticFieldStrength => ElectricCurrent, Resolution => Graphics, WaveNumber => Angle }

    # Converts the object to astronomical units.
    # @return [Length] the equivalent instance in astronomical units
    def to_astronomical_unit(**options) = convert_to('astronomical-unit', **options)

    # Whether or not amount is in astronomical units.
    # @return [true, false]
    def astronomical_unit? = unit == 'astronomical-unit'

    # Converts the object to earth radius.
    # @return [Length] the equivalent instance in earth radius
    def to_earth_radius(**options) = convert_to('earth-radius', **options)

    # Whether or not amount is in earth radius.
    # @return [true, false]
    def earth_radius? = unit == 'earth-radius'

    # Converts the object to fathoms.
    # @return [Length] the equivalent instance in fathoms
    def to_fathom(**options) = convert_to('fathom', **options)

    # Whether or not amount is in fathoms.
    # @return [true, false]
    def fathom? = unit == 'fathom'

    # Converts the object to feet.
    # @return [Length] the equivalent instance in feet
    def to_foot(**options) = convert_to('foot', **options)

    # Whether or not amount is in feet.
    # @return [true, false]
    def foot? = unit == 'foot'

    # Converts the object to furlongs.
    # @return [Length] the equivalent instance in furlongs
    def to_furlong(**options) = convert_to('furlong', **options)

    # Whether or not amount is in furlongs.
    # @return [true, false]
    def furlong? = unit == 'furlong'

    # Converts the object to inches.
    # @return [Length] the equivalent instance in inches
    def to_inch(**options) = convert_to('inch', **options)

    # Whether or not amount is in inches.
    # @return [true, false]
    def inch? = unit == 'inch'

    # Converts the object to light years.
    # @return [Length] the equivalent instance in light years
    def to_light_year(**options) = convert_to('light-year', **options)

    # Whether or not amount is in light years.
    # @return [true, false]
    def light_year? = unit == 'light-year'

    # Converts the object to meters.
    # @return [Length] the equivalent instance in meters
    def to_meter(**options) = convert_to('meter', **options)

    # Whether or not amount is in meters.
    # @return [true, false]
    def meter? = unit == 'meter'

    # Converts the object to miles.
    # @return [Length] the equivalent instance in miles
    def to_mile(**options) = convert_to('mile', **options)

    # Whether or not amount is in miles.
    # @return [true, false]
    def mile? = unit == 'mile'

    # Converts the object to mile-scandinavian.
    # @return [Length] the equivalent instance in mile-scandinavian
    def to_mile_scandinavian(**options) = convert_to('mile-scandinavian', **options)

    # Whether or not amount is in mile-scandinavian.
    # @return [true, false]
    def mile_scandinavian? = unit == 'mile-scandinavian'

    # Converts the object to nautical miles.
    # @return [Length] the equivalent instance in nautical miles
    def to_nautical_mile(**options) = convert_to('nautical-mile', **options)

    # Whether or not amount is in nautical miles.
    # @return [true, false]
    def nautical_mile? = unit == 'nautical-mile'

    # Converts the object to parsecs.
    # @return [Length] the equivalent instance in parsecs
    def to_parsec(**options) = convert_to('parsec', **options)

    # Whether or not amount is in parsecs.
    # @return [true, false]
    def parsec? = unit == 'parsec'

    # Converts the object to points.
    # @return [Length] the equivalent instance in points
    def to_point(**options) = convert_to('point', **options)

    # Whether or not amount is in points.
    # @return [true, false]
    def point? = unit == 'point'

    # Converts the object to solar radii.
    # @return [Length] the equivalent instance in solar radii
    def to_solar_radius(**options) = convert_to('solar-radius', **options)

    # Whether or not amount is in solar radii.
    # @return [true, false]
    def solar_radius? = unit == 'solar-radius'

    # Converts the object to yards.
    # @return [Length] the equivalent instance in yards
    def to_yard(**options) = convert_to('yard', **options)

    # Whether or not amount is in yards.
    # @return [true, false]
    def yard? = unit == 'yard'

    # Converts the object to centimeters.
    # @return [Length] the equivalent instance in centimeters
    def to_centimeter(**options) = convert_to('centimeter', **options)

    # Whether or not amount is in centimeters.
    # @return [true, false]
    def centimeter? = unit == 'centimeter'

    # Converts the object to kilometers.
    # @return [Length] the equivalent instance in kilometers
    def to_kilometer(**options) = convert_to('kilometer', **options)

    # Whether or not amount is in kilometers.
    # @return [true, false]
    def kilometer? = unit == 'kilometer'

    # Converts the object to decimeters.
    # @return [Length] the equivalent instance in decimeters
    def to_decimeter(**options) = convert_to('decimeter', **options)

    # Whether or not amount is in decimeters.
    # @return [true, false]
    def decimeter? = unit == 'decimeter'

    # Converts the object to micrometers.
    # @return [Length] the equivalent instance in micrometers
    def to_micrometer(**options) = convert_to('micrometer', **options)

    # Whether or not amount is in micrometers.
    # @return [true, false]
    def micrometer? = unit == 'micrometer'

    # Converts the object to millimeters.
    # @return [Length] the equivalent instance in millimeters
    def to_millimeter(**options) = convert_to('millimeter', **options)

    # Whether or not amount is in millimeters.
    # @return [true, false]
    def millimeter? = unit == 'millimeter'

    # Converts the object to nanometers.
    # @return [Length] the equivalent instance in nanometers
    def to_nanometer(**options) = convert_to('nanometer', **options)

    # Whether or not amount is in nanometers.
    # @return [true, false]
    def nanometer? = unit == 'nanometer'

    # Converts the object to picometers.
    # @return [Length] the equivalent instance in picometers
    def to_picometer(**options) = convert_to('picometer', **options)

    # Whether or not amount is in picometers.
    # @return [true, false]
    def picometer? = unit == 'picometer'

    # @return [Length] self
    def to_length = self
  end
end
