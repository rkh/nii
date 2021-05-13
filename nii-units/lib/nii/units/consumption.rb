# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent consumption values.
  # 
  # Supported Units:
  # * +cubic-meter-per-meter+ (base unit)
  class Consumption < GenericUnit
    self.quantity  = 'consumption'
    self.base_unit = 'cubic-meter-per-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :Consumption }
    rules.multiply = { Length => Volume, :Portion => :Consumption }

    # @return [Consumption] self
    def to_consumption = self
  end
end
