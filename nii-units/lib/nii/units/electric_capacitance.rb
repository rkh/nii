# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric capacitance values.
  # 
  # Supported Units:
  # * +pow4-second-square-ampere-per-kilogram-square-meter+ (base unit)
  class ElectricCapacitance < GenericUnit
    self.quantity  = 'electric-capacitance'
    self.base_unit = 'pow4-second-square-ampere-per-kilogram-square-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => ElectricCapacitance }
    rules.multiply = { Portion => ElectricCapacitance }

    # @return [ElectricCapacitance] self
    def to_electric_capacitance = self
  end
end
