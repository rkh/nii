# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric charge values.
  # 
  # Supported Units:
  # * +second-ampere+ (base unit)
  class ElectricCharge < GenericUnit
    self.quantity  = 'electric-charge'
    self.base_unit = 'second-ampere'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => ElectricCharge, ElectricCurrent => Duration, Duration => ElectricCurrent }
    rules.multiply = { Portion => ElectricCharge }

    # Converts the object to second-ampere.
    # @return [ElectricCharge] the equivalent instance in second-ampere
    def to_second_ampere(**options) = convert_to('second-ampere', **options)

    # Whether or not amount is in second-ampere.
    # @return [true, false]
    def second_ampere? = unit == 'second-ampere'

    # @return [ElectricCharge] self
    def to_electric_charge = self
  end
end
