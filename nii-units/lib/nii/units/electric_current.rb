# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent electric current values.
  # 
  # Supported Units:
  # * +ampere+ (base unit)
  # * +milliampere+
  class ElectricCurrent < GenericUnit
    self.quantity   =  'electric-current'
    self.base_unit  =  'ampere'
    self.units      =  {
      'milliampere' => { systems: ["metric", "si"], factor: 1r/1000r },
      base_unit     => { systems: ["metric", "si"], factor: 1        }}
    self.aliases    =  {}
    rules.divide    =  { Portion => ElectricCurrent, CurrentDensity => Area, Area => CurrentDensity, MagneticFieldStrength => Length, Length => MagneticFieldStrength }
    rules.multiply  =  { Portion => ElectricCurrent, Duration => ElectricCharge, ElectricResistance => Voltage }

    # Converts the object to amperes.
    # @return [ElectricCurrent] the equivalent instance in amperes
    def to_ampere(**options) = convert_to('ampere', **options)

    # Whether or not amount is in amperes.
    # @return [true, false]
    def ampere? = unit == 'ampere'

    # Converts the object to milliamperes.
    # @return [ElectricCurrent] the equivalent instance in milliamperes
    def to_milliampere(**options) = convert_to('milliampere', **options)

    # Whether or not amount is in milliamperes.
    # @return [true, false]
    def milliampere? = unit == 'milliampere'

    # @return [ElectricCurrent] self
    def to_electric_current = self
  end
end
