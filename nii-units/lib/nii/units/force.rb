# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent force values.
  # 
  # Supported Units:
  # * +kilogram-meter-per-square-second+ (base unit)
  # * +newton+
  # * +pound-force+
  class Force < GenericUnit
    self.quantity   =  'force'
    self.base_unit  =  'kilogram-meter-per-square-second'
    self.units      =  {
      'newton'      => { factor: 1 },
      'pound-force' => { factor: CONSTANTS[:lb_to_kg]*CONSTANTS[:gravity], systems: ["ussystem", "uksystem"] },
      base_unit     => { factor: 1 }}
    self.aliases    =  {}
    rules.divide    =  { Portion => Force }
    rules.multiply  =  { Portion => Force, Length => Energy, Speed => Power }

    # Converts the object to newtons.
    # @return [Force] the equivalent instance in newtons
    def to_newton(**options) = convert_to('newton', **options)

    # Whether or not amount is in newtons.
    # @return [true, false]
    def newton? = unit == 'newton'

    # Converts the object to pounds of force.
    # @return [Force] the equivalent instance in pounds of force
    def to_pound_force(**options) = convert_to('pound-force', **options)

    # Whether or not amount is in pounds of force.
    # @return [true, false]
    def pound_force? = unit == 'pound-force'

    # @return [Force] self
    def to_force = self
  end
end
