# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent speed values.
  # 
  # Supported Units:
  # * +knot+
  # * +meter-per-second+ (base unit)
  class Speed < GenericUnit
    self.quantity  =  'speed'
    self.base_unit =  'meter-per-second'
    self.units     =  {
      'knot'       => { factor: 1852r/3600r, systems: ["ussystem", "uksystem"] },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Speed, Acceleration => Duration, Duration => Acceleration }
    rules.multiply =  { Portion => Speed, Force => Power, Torque => Power }

    # Converts the object to knots.
    # @return [Speed] the equivalent instance in knots
    def to_knot(**options) = convert_to('knot', **options)

    # Whether or not amount is in knots.
    # @return [true, false]
    def knot? = unit == 'knot'

    # Converts the object to meters per second.
    # @return [Speed] the equivalent instance in meters per second
    def to_meter_per_second(**options) = convert_to('meter-per-second', **options)

    # Whether or not amount is in meters per second.
    # @return [true, false]
    def meter_per_second? = unit == 'meter-per-second'

    # @return [Speed] self
    def to_speed = self
  end
end
