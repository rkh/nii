# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric resistance values.
  # 
  # Supported Units:
  # * +kilogram-square-meter-per-cubic-second-square-ampere+ (base unit)
  # * +ohm+
  class ElectricResistance < GenericUnit
    self.quantity  =  'electric-resistance'
    self.base_unit =  'kilogram-square-meter-per-cubic-second-square-ampere'
    self.units     =  {
      'ohm'        => { factor: 1 },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => ElectricResistance }
    rules.multiply =  { Portion => ElectricResistance, ElectricCurrent => Voltage, Duration => ElectricInductance }

    # Converts the object to ohms.
    # @return [ElectricResistance] the equivalent instance in ohms
    def to_ohm(**options) = convert_to('ohm', **options)

    # Whether or not amount is in ohms.
    # @return [true, false]
    def ohm? = unit == 'ohm'

    # @return [ElectricResistance] self
    def to_electric_resistance = self
  end
end
