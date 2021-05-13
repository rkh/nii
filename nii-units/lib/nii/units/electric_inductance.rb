# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric inductance values.
  # 
  # Supported Units:
  # * +kilogram-square-meter-per-square-second-square-ampere+ (base unit)
  class ElectricInductance < GenericUnit
    self.quantity  = 'electric-inductance'
    self.base_unit = 'kilogram-square-meter-per-square-second-square-ampere'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :ElectricInductance, :ElectricResistance => :Duration, :Duration => :ElectricResistance }
    rules.multiply = { :Portion => :ElectricInductance }

    # @return [ElectricInductance] self
    def to_electric_inductance = self
  end
end
