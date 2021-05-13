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
  # * +dot-per-centimeter+
  # * +dot-per-inch+
  class Resolution < GenericUnit
    self.quantity          =  'resolution'
    self.base_unit         =  'pixel-per-meter'
    self.units             =  {
      'dot-per-centimeter' => { factor: (1r/100r)/(1r), systems: ["metric", "si"], symbol: 'dpcm' },
      'dot-per-inch'       => { factor: (CONSTANTS[:ft_to_m]/12r)/(1r), systems: ["ussystem", "uksystem"], symbol: 'dpi' },
      base_unit            => { factor: 1 }}
    self.aliases           =  {
      'dpcm'               => 'dot-per-centimeter',
      'dpi'                => 'dot-per-inch'}
    rules.divide           =  { :Portion => :Resolution }
    rules.multiply         =  { :Portion => :Resolution, :Length => :Graphics }

    # Converts the object to pixel-per-meter.
    # @return [Resolution] the equivalent instance in pixel-per-meter
    def to_pixel_per_meter(**options) = convert_to('pixel-per-meter', **options)

    # Whether or not amount is in pixel-per-meter.
    # @return [true, false]
    def pixel_per_meter? = unit == 'pixel-per-meter'

    # Converts the object to dots per centimeter.
    # @return [Resolution] the equivalent instance in dots per centimeter
    def to_dot_per_centimeter(**options) = convert_to('dot-per-centimeter', **options)

    # Whether or not amount is in dots per centimeter.
    # @return [true, false]
    def dot_per_centimeter? = unit == 'dot-per-centimeter'

    alias_method :to_dpcm, :to_dot_per_centimeter
    alias_method :dpcm?, :dot_per_centimeter?

    # Converts the object to dots per inch.
    # @return [Resolution] the equivalent instance in dots per inch
    def to_dot_per_inch(**options) = convert_to('dot-per-inch', **options)

    # Whether or not amount is in dots per inch.
    # @return [true, false]
    def dot_per_inch? = unit == 'dot-per-inch'

    alias_method :to_dpi, :to_dot_per_inch
    alias_method :dpi?, :dot_per_inch?

    # @return [Resolution] self
    def to_resolution = self
  end
end
