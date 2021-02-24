# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent solid angle values.
  # 
  # Supported Units:
  # * +square-revolution+ (base unit)
  class SolidAngle < GenericUnit
    self.quantity  = 'solid-angle'
    self.base_unit = 'square-revolution'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => SolidAngle, Angle => Angle }
    rules.multiply = { Portion => SolidAngle }

    # Converts the object to square-revolution.
    # @return [SolidAngle] the equivalent instance in square-revolution
    def to_square_revolution(**options) = convert_to('square-revolution', **options)

    # Whether or not amount is in square-revolution.
    # @return [true, false]
    def square_revolution? = unit == 'square-revolution'

    # @return [SolidAngle] self
    def to_solid_angle = self
  end
end
