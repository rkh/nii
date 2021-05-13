# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent mass density values.
  # 
  # Supported Units:
  # * +kilogram-per-cubic-meter+ (base unit)
  class MassDensity < GenericUnit
    self.quantity  = 'mass-density'
    self.base_unit = 'kilogram-per-cubic-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :MassDensity }
    rules.multiply = { :Portion => :MassDensity, :Volume => :Mass }

    # @return [MassDensity] self
    def to_mass_density = self
  end
end
