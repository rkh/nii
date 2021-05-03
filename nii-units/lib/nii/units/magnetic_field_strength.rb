# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent magnetic field strength values.
  # 
  # Supported Units:
  # * +ampere-per-meter+ (base unit)
  class MagneticFieldStrength < GenericUnit
    self.quantity  = 'magnetic-field-strength'
    self.base_unit = 'ampere-per-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => MagneticFieldStrength, CurrentDensity => Length, Length => CurrentDensity }
    rules.multiply = { Portion => MagneticFieldStrength, Length => ElectricCurrent }

    # Converts the object to ampere-per-meter.
    # @return [MagneticFieldStrength] the equivalent instance in ampere-per-meter
    def to_ampere_per_meter(**options) = convert_to('ampere-per-meter', **options)

    # Whether or not amount is in ampere-per-meter.
    # @return [true, false]
    def ampere_per_meter? = unit == 'ampere-per-meter'

    # @return [MagneticFieldStrength] self
    def to_magnetic_field_strength = self
  end
end
