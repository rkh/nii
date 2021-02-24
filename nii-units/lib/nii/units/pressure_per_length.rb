# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent pressure per length values.
  # 
  # Supported Units:
  # * +kilogram-per-square-meter-square-second+ (base unit)
  # * +ofhg+
  class PressurePerLength < GenericUnit
    self.quantity  =  'pressure-per-length'
    self.base_unit =  'kilogram-per-square-meter-square-second'
    self.units     =  {
      'ofhg'       => { factor: 13595.1r*CONSTANTS[:gravity] },
      base_unit    => { factor: 1                            }}
    self.aliases   =  {}
    rules.divide   =  { Portion => PressurePerLength }
    rules.multiply =  { Portion => PressurePerLength, Area => Pressure }

    # Converts the object to ofhg.
    # @return [PressurePerLength] the equivalent instance in ofhg
    def to_ofhg(**options) = convert_to('ofhg', **options)

    # Whether or not amount is in ofhg.
    # @return [true, false]
    def ofhg? = unit == 'ofhg'

    # @return [PressurePerLength] self
    def to_pressure_per_length = self
  end
end
