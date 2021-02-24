# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent graphics values.
  # 
  # Supported Units:
  # * +dot+
  # * +pixel+ (base unit)
  # * +megapixel+
  class Graphics < GenericUnit
    self.quantity  =  'graphics'
    self.base_unit =  'pixel'
    self.units     =  {
      'dot'        => { factor: 1       },
      'megapixel'  => { factor: 1000000 },
      base_unit    => { factor: 1       }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Graphics, Resolution => Length, Length => Resolution }
    rules.multiply =  { Portion => Graphics }

    # Converts the object to dot.
    # @return [Graphics] the equivalent instance in dot
    def to_dot(**options) = convert_to('dot', **options)

    # Whether or not amount is in dot.
    # @return [true, false]
    def dot? = unit == 'dot'

    # Converts the object to pixels.
    # @return [Graphics] the equivalent instance in pixels
    def to_pixel(**options) = convert_to('pixel', **options)

    # Whether or not amount is in pixels.
    # @return [true, false]
    def pixel? = unit == 'pixel'

    # Converts the object to megapixels.
    # @return [Graphics] the equivalent instance in megapixels
    def to_megapixel(**options) = convert_to('megapixel', **options)

    # Whether or not amount is in megapixels.
    # @return [true, false]
    def megapixel? = unit == 'megapixel'

    # @return [Graphics] self
    def to_graphics = self
  end
end
