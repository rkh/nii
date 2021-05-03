# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent torque values.
  # 
  # Supported Units:
  # * +kilogram-meter-per-meter-square-second+ (base unit)
  class Torque < GenericUnit
    self.quantity  = 'torque'
    self.base_unit = 'kilogram-meter-per-meter-square-second'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => Torque }
    rules.multiply = { Portion => Torque, Speed => Power }

    # @return [Torque] self
    def to_torque = self
  end
end
