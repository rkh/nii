# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent mass values.
  # 
  # Supported Units:
  # * +carat+
  # * +earth-mass+
  # * +grain+
  # * +gram+
  # * +kilogram+ (base unit)
  # * +metric-ton+
  # * +ounce+
  # * +ounce-troy+
  # * +pound+
  # * +solar-mass+
  # * +stone+
  # * +ton+
  # * +microgram+
  # * +milligram+
  class Mass < GenericUnit
    self.quantity  =  'mass'
    self.base_unit =  'kilogram'
    self.units     =  {
      'carat'      => { factor: 0.0002r, systems: ["metric"] },
      'earth-mass' => { factor: '5.9722E+24'.to_r },
      'grain'      => { factor: CONSTANTS[:lb_to_kg]/7000r, systems: ["ussystem", "uksystem"] },
      'gram'       => { factor: 0.001r, systems: ["metric", "si"] },
      'metric-ton' => { factor: 1000, systems: ["metric"] },
      'microgram'  => { factor: 0.001r/1000000r, systems: ["metric", "si"] },
      'milligram'  => { factor: 0.001r/1000r, systems: ["metric", "si"] },
      'ounce'      => { factor: CONSTANTS[:lb_to_kg]/16r, systems: ["ussystem", "uksystem"] },
      'ounce-troy' => { factor: 0.03110348r, systems: ["ussystem", "uksystem"] },
      'pound'      => { factor: CONSTANTS[:lb_to_kg], systems: ["ussystem", "uksystem"] },
      'solar-mass' => { factor: '1.98847E+30'.to_r },
      'stone'      => { factor: CONSTANTS[:lb_to_kg]*14r, systems: ["uksystem"] },
      'ton'        => { factor: CONSTANTS[:lb_to_kg]*2000r, systems: ["ussystem", "uksystem"] },
      base_unit    => { systems: ["metric", "si"], factor: 1 }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Mass, MassDensity => Volume, Volume => MassDensity }
    rules.multiply =  { Portion => Mass, MassFraction => Mass, SpecificVolume => Volume }

    # Converts the object to carats.
    # @return [Mass] the equivalent instance in carats
    def to_carat(**options) = convert_to('carat', **options)

    # Whether or not amount is in carats.
    # @return [true, false]
    def carat? = unit == 'carat'

    # Converts the object to Earth masses.
    # @return [Mass] the equivalent instance in Earth masses
    def to_earth_mass(**options) = convert_to('earth-mass', **options)

    # Whether or not amount is in Earth masses.
    # @return [true, false]
    def earth_mass? = unit == 'earth-mass'

    # Converts the object to grain.
    # @return [Mass] the equivalent instance in grain
    def to_grain(**options) = convert_to('grain', **options)

    # Whether or not amount is in grain.
    # @return [true, false]
    def grain? = unit == 'grain'

    # Converts the object to grams.
    # @return [Mass] the equivalent instance in grams
    def to_gram(**options) = convert_to('gram', **options)

    # Whether or not amount is in grams.
    # @return [true, false]
    def gram? = unit == 'gram'

    # Converts the object to kilograms.
    # @return [Mass] the equivalent instance in kilograms
    def to_kilogram(**options) = convert_to('kilogram', **options)

    # Whether or not amount is in kilograms.
    # @return [true, false]
    def kilogram? = unit == 'kilogram'

    # Converts the object to metric tons.
    # @return [Mass] the equivalent instance in metric tons
    def to_metric_ton(**options) = convert_to('metric-ton', **options)

    # Whether or not amount is in metric tons.
    # @return [true, false]
    def metric_ton? = unit == 'metric-ton'

    # Converts the object to ounces.
    # @return [Mass] the equivalent instance in ounces
    def to_ounce(**options) = convert_to('ounce', **options)

    # Whether or not amount is in ounces.
    # @return [true, false]
    def ounce? = unit == 'ounce'

    # Converts the object to troy ounces.
    # @return [Mass] the equivalent instance in troy ounces
    def to_ounce_troy(**options) = convert_to('ounce-troy', **options)

    # Whether or not amount is in troy ounces.
    # @return [true, false]
    def ounce_troy? = unit == 'ounce-troy'

    # Converts the object to pounds.
    # @return [Mass] the equivalent instance in pounds
    def to_pound(**options) = convert_to('pound', **options)

    # Whether or not amount is in pounds.
    # @return [true, false]
    def pound? = unit == 'pound'

    # Converts the object to solar masses.
    # @return [Mass] the equivalent instance in solar masses
    def to_solar_mass(**options) = convert_to('solar-mass', **options)

    # Whether or not amount is in solar masses.
    # @return [true, false]
    def solar_mass? = unit == 'solar-mass'

    # Converts the object to stones.
    # @return [Mass] the equivalent instance in stones
    def to_stone(**options) = convert_to('stone', **options)

    # Whether or not amount is in stones.
    # @return [true, false]
    def stone? = unit == 'stone'

    # Converts the object to tons.
    # @return [Mass] the equivalent instance in tons
    def to_ton(**options) = convert_to('ton', **options)

    # Whether or not amount is in tons.
    # @return [true, false]
    def ton? = unit == 'ton'

    # Converts the object to micrograms.
    # @return [Mass] the equivalent instance in micrograms
    def to_microgram(**options) = convert_to('microgram', **options)

    # Whether or not amount is in micrograms.
    # @return [true, false]
    def microgram? = unit == 'microgram'

    # Converts the object to milligrams.
    # @return [Mass] the equivalent instance in milligrams
    def to_milligram(**options) = convert_to('milligram', **options)

    # Whether or not amount is in milligrams.
    # @return [true, false]
    def milligram? = unit == 'milligram'

    # @return [Mass] self
    def to_mass = self
  end
end
