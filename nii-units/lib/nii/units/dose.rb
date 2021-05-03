# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent dose values.
  # 
  # Supported Units:
  # * +square-meter-per-square-second+ (base unit)
  class Dose < GenericUnit
    self.quantity  = 'dose'
    self.base_unit = 'square-meter-per-square-second'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => Dose }
    rules.multiply = { Portion => Dose }

    # @return [Dose] self
    def to_dose = self
  end
end
