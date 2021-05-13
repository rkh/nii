# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric conductance values.
  # 
  # Supported Units:
  # * +cubic-second-square-ampere-per-kilogram-square-meter+ (base unit)
  class ElectricConductance < GenericUnit
    self.quantity  = 'electric-conductance'
    self.base_unit = 'cubic-second-square-ampere-per-kilogram-square-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :ElectricConductance }
    rules.multiply = { :Portion => :ElectricConductance }

    # @return [ElectricConductance] self
    def to_electric_conductance = self
  end
end
