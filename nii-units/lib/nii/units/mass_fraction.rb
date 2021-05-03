# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent mass fraction values.
  # 
  # Supported Units:
  # * +kilogram-per-kilogram+ (base unit)
  class MassFraction < GenericUnit
    self.quantity  = 'mass-fraction'
    self.base_unit = 'kilogram-per-kilogram'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => MassFraction }
    rules.multiply = { Portion => MassFraction, Mass => Mass }

    # @return [MassFraction] self
    def to_mass_fraction = self
  end
end
