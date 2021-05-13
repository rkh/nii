# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent magnetic induction values.
  # 
  # Supported Units:
  # * +kilogram-per-square-second-ampere+ (base unit)
  class MagneticInduction < GenericUnit
    self.quantity  = 'magnetic-induction'
    self.base_unit = 'kilogram-per-square-second-ampere'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :MagneticInduction }
    rules.multiply = { :Portion => :MagneticInduction }

    # @return [MagneticInduction] self
    def to_magnetic_induction = self
  end
end
