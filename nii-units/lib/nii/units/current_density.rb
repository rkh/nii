# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent current density values.
  # 
  # Supported Units:
  # * +ampere-per-square-meter+ (base unit)
  class CurrentDensity < GenericUnit
    self.quantity  = 'current-density'
    self.base_unit = 'ampere-per-square-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => CurrentDensity }
    rules.multiply = { Portion => CurrentDensity, Area => ElectricCurrent, Length => MagneticFieldStrength }

    # @return [CurrentDensity] self
    def to_current_density = self
  end
end
