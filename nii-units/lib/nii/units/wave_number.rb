# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent wave number values.
  # 
  # Supported Units:
  # * +revolution-per-meter+ (base unit)
  class WaveNumber < GenericUnit
    self.quantity  = 'wave-number'
    self.base_unit = 'revolution-per-meter'
    self.units     = { base_unit => { factor: 1 }}
    self.aliases   = {}
    rules.divide   = { :Portion => :WaveNumber }
    rules.multiply = { :Portion => :WaveNumber, :Length => :Angle }

    # Converts the object to revolution-per-meter.
    # @return [WaveNumber] the equivalent instance in revolution-per-meter
    def to_revolution_per_meter(**options) = convert_to('revolution-per-meter', **options)

    # Whether or not amount is in revolution-per-meter.
    # @return [true, false]
    def revolution_per_meter? = unit == 'revolution-per-meter'

    # @return [WaveNumber] self
    def to_wave_number = self
  end
end
