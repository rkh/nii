# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent acceleration values.
  # 
  # Supported Units:
  # * +g-force+
  # * +meter-per-square-second+ (base unit)
  class Acceleration < GenericUnit
    self.quantity  =  'acceleration'
    self.base_unit =  'meter-per-square-second'
    self.units     =  {
      'g-force'    => { factor: CONSTANTS[:gravity] },
      base_unit    => { factor: 1                   }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Acceleration }
    rules.multiply =  { Portion => Acceleration, Duration => Speed }

    # Converts the object to g-force.
    # @return [Acceleration] the equivalent instance in g-force
    def to_g_force(**options) = convert_to('g-force', **options)

    # Whether or not amount is in g-force.
    # @return [true, false]
    def g_force? = unit == 'g-force'

    # @return [Acceleration] self
    def to_acceleration = self
  end
end
