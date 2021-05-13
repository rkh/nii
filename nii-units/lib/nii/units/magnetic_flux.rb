# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent magnetic flux values.
  # 
  # Supported Units:
  # * +kilogram-square-meter-per-square-second-ampere+ (base unit)
  class MagneticFlux < GenericUnit
    self.quantity  = 'magnetic-flux'
    self.base_unit = 'kilogram-square-meter-per-square-second-ampere'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :MagneticFlux }
    rules.multiply = { :Portion => :MagneticFlux }

    # @return [MagneticFlux] self
    def to_magnetic_flux = self
  end
end
