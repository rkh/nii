# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent luminous intensity values.
  # 
  # Supported Units:
  # * +candela+ (base unit)
  class LuminousIntensity < GenericUnit
    self.quantity  = 'luminous-intensity'
    self.base_unit = 'candela'
    self.units     = { base_unit => { systems: ["metric", "si"], factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :LuminousIntensity, :Illuminance => :Area, :Area => :Illuminance }
    rules.multiply = { :Portion => :LuminousIntensity }

    # Converts the object to candela.
    # @return [LuminousIntensity] the equivalent instance in candela
    def to_candela(**options) = convert_to('candela', **options)

    # Whether or not amount is in candela.
    # @return [true, false]
    def candela? = unit == 'candela'

    # @return [LuminousIntensity] self
    def to_luminous_intensity = self
  end
end
