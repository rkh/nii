# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent substance amount values.
  # 
  # Supported Units:
  # * +item+ (base unit)
  # * +mole+
  # * +millimole+
  class SubstanceAmount < GenericUnit
    self.quantity  =  'substance-amount'
    self.base_unit =  'item'
    self.units     =  {
      'millimole'  => { factor: CONSTANTS[:item_per_mole]/1000r, systems: ["metric", "si"] },
      'mole'       => { factor: CONSTANTS[:item_per_mole], systems: ["metric", "si"] },
      base_unit    => { factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => SubstanceAmount, Concentration => Volume, Volume => Concentration }
    rules.multiply =  { Portion => SubstanceAmount }

    # Converts the object to item.
    # @return [SubstanceAmount] the equivalent instance in item
    def to_item(**options) = convert_to('item', **options)

    # Whether or not amount is in item.
    # @return [true, false]
    def item? = unit == 'item'

    # Converts the object to moles.
    # @return [SubstanceAmount] the equivalent instance in moles
    def to_mole(**options) = convert_to('mole', **options)

    # Whether or not amount is in moles.
    # @return [true, false]
    def mole? = unit == 'mole'

    # Converts the object to millimole.
    # @return [SubstanceAmount] the equivalent instance in millimole
    def to_millimole(**options) = convert_to('millimole', **options)

    # Whether or not amount is in millimole.
    # @return [true, false]
    def millimole? = unit == 'millimole'

    # @return [SubstanceAmount] self
    def to_substance_amount = self
  end
end
