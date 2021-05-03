# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent angle values.
  # 
  # Supported Units:
  # * +arc-minute+
  # * +arc-second+
  # * +degree+
  # * +radian+
  # * +revolution+ (base unit)
  class Angle < GenericUnit
    self.quantity  =  'angle'
    self.base_unit =  'revolution'
    self.units     =  {
      'arc-minute' => { factor: 1r/360r*60r, symbol: 'arcmins'     },
      'arc-second' => { factor: 1r/360r*60r*60r, symbol: 'arcsecs' },
      'degree'     => { factor: 1r/360r, symbol: 'deg'             },
      'radian'     => { factor: 1r/2r*CONSTANTS[:PI]               },
      base_unit    => { factor: 1                                  }}
    self.aliases   =  {
      'arcmins'    => 'arc-minute',
      'arcsecs'    => 'arc-second',
      'deg'        => 'degree'}
    rules.divide   =  { Portion => Angle, Frequency => Duration, Duration => Frequency, WaveNumber => Length, Length => WaveNumber }
    rules.multiply =  { Portion => Angle, Angle => SolidAngle }

    # Converts the object to arcminutes.
    # @return [Angle] the equivalent instance in arcminutes
    def to_arc_minute(**options) = convert_to('arc-minute', **options)

    # Whether or not amount is in arcminutes.
    # @return [true, false]
    def arc_minute? = unit == 'arc-minute'

    alias_method :to_arcmins, :to_arc_minute
    alias_method :arcmins?, :arc_minute?

    # Converts the object to arcseconds.
    # @return [Angle] the equivalent instance in arcseconds
    def to_arc_second(**options) = convert_to('arc-second', **options)

    # Whether or not amount is in arcseconds.
    # @return [true, false]
    def arc_second? = unit == 'arc-second'

    alias_method :to_arcsecs, :to_arc_second
    alias_method :arcsecs?, :arc_second?

    # Converts the object to degrees.
    # @return [Angle] the equivalent instance in degrees
    def to_degree(**options) = convert_to('degree', **options)

    # Whether or not amount is in degrees.
    # @return [true, false]
    def degree? = unit == 'degree'

    alias_method :to_deg, :to_degree
    alias_method :deg?, :degree?

    # Converts the object to radians.
    # @return [Angle] the equivalent instance in radians
    def to_radian(**options) = convert_to('radian', **options)

    # Whether or not amount is in radians.
    # @return [true, false]
    def radian? = unit == 'radian'

    # Converts the object to revolution.
    # @return [Angle] the equivalent instance in revolution
    def to_revolution(**options) = convert_to('revolution', **options)

    # Whether or not amount is in revolution.
    # @return [true, false]
    def revolution? = unit == 'revolution'

    # @return [Angle] self
    def to_angle = self
  end
end
