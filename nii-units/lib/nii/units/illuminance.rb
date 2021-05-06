# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent illuminance values.
  # 
  # Supported Units:
  # * +candela-per-square-meter+ (base unit)
  # * +lux+
  class Illuminance < GenericUnit
    self.quantity  =  'illuminance'
    self.base_unit =  'candela-per-square-meter'
    self.units     =  {
      'lux'        => { systems: ["metric", "si"], factor: 1 },
      base_unit    => { factor: 1                            }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Illuminance }
    rules.multiply =  { Portion => Illuminance, Area => LuminousIntensity }

    # Converts the object to lux.
    # @return [Illuminance] the equivalent instance in lux
    def to_lux(**options) = convert_to('lux', **options)

    # Whether or not amount is in lux.
    # @return [true, false]
    def lux? = unit == 'lux'

    # @return [Illuminance] self
    def to_illuminance = self
  end
end
