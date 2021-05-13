# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent specific volume values.
  # 
  # Supported Units:
  # * +cubic-meter-per-kilogram+ (base unit)
  class SpecificVolume < GenericUnit
    self.quantity  = 'specific-volume'
    self.base_unit = 'cubic-meter-per-kilogram'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :SpecificVolume }
    rules.multiply = { :Portion => :SpecificVolume, :Mass => :Volume }

    # @return [SpecificVolume] self
    def to_specific_volume = self
  end
end
