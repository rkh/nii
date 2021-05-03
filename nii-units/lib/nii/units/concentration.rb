# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent concentration values.
  # 
  # Supported Units:
  # * +item-per-cubic-meter+ (base unit)
  class Concentration < GenericUnit
    self.quantity  = 'concentration'
    self.base_unit = 'item-per-cubic-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => Concentration }
    rules.multiply = { Portion => Concentration, Volume => SubstanceAmount }

    # Converts the object to item-per-cubic-meter.
    # @return [Concentration] the equivalent instance in item-per-cubic-meter
    def to_item_per_cubic_meter(**options) = convert_to('item-per-cubic-meter', **options)

    # Whether or not amount is in item-per-cubic-meter.
    # @return [true, false]
    def item_per_cubic_meter? = unit == 'item-per-cubic-meter'

    # @return [Concentration] self
    def to_concentration = self
  end
end
