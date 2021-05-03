# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent resolution values.
  # 
  # Supported Units:
  # * +pixel-per-meter+ (base unit)
  class Resolution < GenericUnit
    self.quantity  = 'resolution'
    self.base_unit = 'pixel-per-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => Resolution }
    rules.multiply = { Portion => Resolution, Length => Graphics }

    # Converts the object to pixel-per-meter.
    # @return [Resolution] the equivalent instance in pixel-per-meter
    def to_pixel_per_meter(**options) = convert_to('pixel-per-meter', **options)

    # Whether or not amount is in pixel-per-meter.
    # @return [true, false]
    def pixel_per_meter? = unit == 'pixel-per-meter'

    # @return [Resolution] self
    def to_resolution = self
  end
end
