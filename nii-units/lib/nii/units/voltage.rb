# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent voltage values.
  # 
  # Supported Units:
  # * +kilogram-square-meter-per-cubic-second-ampere+ (base unit)
  # * +volt+
  class Voltage < GenericUnit
    self.quantity  =  'voltage'
    self.base_unit =  'kilogram-square-meter-per-cubic-second-ampere'
    self.units     =  {
      'volt'       => { systems: ["metric", "si"], factor: 1 },
      base_unit    => { factor: 1                            }}
    self.aliases   =  {}
    rules.divide   =  { :Portion => :Voltage, :ElectricCurrent => :ElectricResistance, :ElectricResistance => :ElectricCurrent }
    rules.multiply =  { :Portion => :Voltage }

    # Converts the object to volts.
    # @return [Voltage] the equivalent instance in volts
    def to_volt(**options) = convert_to('volt', **options)

    # Whether or not amount is in volts.
    # @return [true, false]
    def volt? = unit == 'volt'

    # @return [Voltage] self
    def to_voltage = self
  end
end
