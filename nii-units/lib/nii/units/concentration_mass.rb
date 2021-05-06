# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent concentration mass values.
  # 
  # Supported Units:
  # * +item-per-kilogram+ (base unit)
  # * +ofglucose+
  class ConcentrationMass < GenericUnit
    self.quantity  =  'concentration-mass'
    self.base_unit =  'item-per-kilogram'
    self.units     =  {
      'ofglucose'  => { factor: 1000r*CONSTANTS[:item_per_mole]/CONSTANTS[:glucose_molar_mass] },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => ConcentrationMass }
    rules.multiply =  { Portion => ConcentrationMass }

    # Converts the object to item-per-kilogram.
    # @return [ConcentrationMass] the equivalent instance in item-per-kilogram
    def to_item_per_kilogram(**options) = convert_to('item-per-kilogram', **options)

    # Whether or not amount is in item-per-kilogram.
    # @return [true, false]
    def item_per_kilogram? = unit == 'item-per-kilogram'

    # Converts the object to ofglucose.
    # @return [ConcentrationMass] the equivalent instance in ofglucose
    def to_ofglucose(**options) = convert_to('ofglucose', **options)

    # Whether or not amount is in ofglucose.
    # @return [true, false]
    def ofglucose? = unit == 'ofglucose'

    # @return [ConcentrationMass] self
    def to_concentration_mass = self
  end
end
