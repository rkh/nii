# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent luminous flux values.
  # 
  # Supported Units:
  # * +candela-square-meter-per-square-meter+ (base unit)
  # * +lumen+
  class LuminousFlux < GenericUnit
    self.quantity  =  'luminous-flux'
    self.base_unit =  'candela-square-meter-per-square-meter'
    self.units     =  {
      'lumen'      => { factor: 1 },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => LuminousFlux }
    rules.multiply =  { Portion => LuminousFlux }

    # Converts the object to lumen.
    # @return [LuminousFlux] the equivalent instance in lumen
    def to_lumen(**options) = convert_to('lumen', **options)

    # Whether or not amount is in lumen.
    # @return [true, false]
    def lumen? = unit == 'lumen'

    # @return [LuminousFlux] self
    def to_luminous_flux = self
  end
end
