# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent typewidth values.
  # 
  # Supported Units:
  # * +em+ (base unit)
  class Typewidth < GenericUnit
    self.quantity  = 'typewidth'
    self.base_unit = 'em'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { Portion => Typewidth }
    rules.multiply = { Portion => Typewidth }

    # Converts the object to typographic em.
    # @return [Typewidth] the equivalent instance in typographic em
    def to_em(**options) = convert_to('em', **options)

    # Whether or not amount is in typographic em.
    # @return [true, false]
    def em? = unit == 'em'

    # @return [Typewidth] self
    def to_typewidth = self
  end
end
