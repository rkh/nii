# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent volume values.
  # 
  # Supported Units:
  # * +barrel+
  # * +bushel+
  # * +cubic-meter+ (base unit)
  # * +cup+
  # * +cup-metric+
  # * +dessert-spoon+
  # * +dessert-spoon-imperial+
  # * +dram+
  # * +drop+
  # * +fluid-ounce+
  # * +fluid-ounce-imperial+
  # * +gallon+
  # * +gallon-imperial+
  # * +jigger+
  # * +liter+
  # * +pinch+
  # * +pint+
  # * +pint-metric+
  # * +quart+
  # * +quart-imperial+
  # * +tablespoon+
  # * +teaspoon+
  # * +centiliter+
  # * +cubic-centimeter+
  # * +cubic-foot+
  # * +cubic-inch+
  # * +cubic-kilometer+
  # * +cubic-mile+
  # * +cubic-yard+
  # * +deciliter+
  # * +hectoliter+
  # * +megaliter+
  # * +milliliter+
  class Volume < GenericUnit
    self.quantity  =  'volume'
    self.base_unit =  'cubic-meter'
    self.units     =  {
      'barrel'                 => { factor: 42r*CONSTANTS[:gal_to_m3], systems: ["ussystem"] },
      'bushel'                 => { factor: 2150.42r*CONSTANTS[:in3_to_m3], systems: ["ussystem"] },
      'centiliter'             => { factor: 0.001r/100r },
      'cubic-centimeter'       => { factor: 1r/100r*1r/100r*1r/100r },
      'cubic-foot'             => { factor: CONSTANTS[:ft_to_m]*CONSTANTS[:ft_to_m]*CONSTANTS[:ft_to_m], systems: ["ussystem", "uksystem"] },
      'cubic-inch'             => { factor: CONSTANTS[:ft_to_m]/12r*CONSTANTS[:ft_to_m]/12r*CONSTANTS[:ft_to_m]/12r, systems: ["ussystem", "uksystem"] },
      'cubic-kilometer'        => { factor: 1000r*1000r*1000r },
      'cubic-mile'             => { factor: CONSTANTS[:ft_to_m]*5280r*CONSTANTS[:ft_to_m]*5280r*CONSTANTS[:ft_to_m]*5280r, systems: ["ussystem", "uksystem"] },
      'cubic-yard'             => { factor: CONSTANTS[:ft_to_m]*3r*CONSTANTS[:ft_to_m]*3r*CONSTANTS[:ft_to_m]*3r, systems: ["ussystem", "uksystem"] },
      'cup'                    => { factor: CONSTANTS[:gal_to_m3]/16r, systems: ["ussystem"] },
      'cup-metric'             => { factor: 0.00025r },
      'deciliter'              => { factor: 0.001r/10r },
      'dessert-spoon'          => { factor: CONSTANTS[:gal_to_m3]/16r*128r, systems: ["ussystem"] },
      'dessert-spoon-imperial' => { factor: CONSTANTS[:gal_imp_to_m3]/16r*128r, systems: ["uksystem"] },
      'dram'                   => { factor: CONSTANTS[:gal_to_m3]/128r*8r, systems: ["ussystem"] },
      'drop'                   => { factor: CONSTANTS[:gal_to_m3]/128r*576r, systems: ["ussystem"] },
      'fluid-ounce'            => { factor: CONSTANTS[:gal_to_m3]/128r, systems: ["ussystem"] },
      'fluid-ounce-imperial'   => { factor: CONSTANTS[:gal_imp_to_m3]/160r, systems: ["uksystem"] },
      'gallon'                 => { factor: CONSTANTS[:gal_to_m3], systems: ["ussystem"], symbol: 'gal' },
      'gallon-imperial'        => { factor: CONSTANTS[:gal_imp_to_m3], systems: ["uksystem"] },
      'hectoliter'             => { factor: 0.001r*100r },
      'jigger'                 => { factor: CONSTANTS[:gal_to_m3]*3r/128r*2r, systems: ["ussystem"] },
      'liter'                  => { factor: 0.001r, symbol: 'L' },
      'megaliter'              => { factor: 0.001r*1000000r },
      'milliliter'             => { factor: 0.001r/1000r },
      'pinch'                  => { factor: CONSTANTS[:gal_to_m3]/128r*128r, systems: ["ussystem"] },
      'pint'                   => { factor: CONSTANTS[:gal_to_m3]/8r, systems: ["ussystem"] },
      'pint-metric'            => { factor: 0.0005r },
      'quart'                  => { factor: CONSTANTS[:gal_to_m3]/4r, systems: ["ussystem"] },
      'quart-imperial'         => { factor: CONSTANTS[:gal_imp_to_m3]/4r, systems: ["uksystem"] },
      'tablespoon'             => { factor: CONSTANTS[:gal_to_m3]/256r, systems: ["ussystem"] },
      'teaspoon'               => { factor: CONSTANTS[:gal_to_m3]/16r*48r, systems: ["ussystem"] },
      base_unit                => { factor: 1 }}
    self.aliases   =  {
      'L'                      => 'liter',
      'gal'                    => 'gallon'}
    rules.divide   =  { Consumption => Length, Portion => Volume, Length => Area, Area => Length, SpecificVolume => Mass, Mass => SpecificVolume }
    rules.multiply =  { Portion => Volume, Concentration => SubstanceAmount, MassDensity => Mass }

    # Converts the object to barrels.
    # @return [Volume] the equivalent instance in barrels
    def to_barrel(**options) = convert_to('barrel', **options)

    # Whether or not amount is in barrels.
    # @return [true, false]
    def barrel? = unit == 'barrel'

    # Converts the object to bushels.
    # @return [Volume] the equivalent instance in bushels
    def to_bushel(**options) = convert_to('bushel', **options)

    # Whether or not amount is in bushels.
    # @return [true, false]
    def bushel? = unit == 'bushel'

    # Converts the object to cubic meters.
    # @return [Volume] the equivalent instance in cubic meters
    def to_cubic_meter(**options) = convert_to('cubic-meter', **options)

    # Whether or not amount is in cubic meters.
    # @return [true, false]
    def cubic_meter? = unit == 'cubic-meter'

    # Converts the object to cups.
    # @return [Volume] the equivalent instance in cups
    def to_cup(**options) = convert_to('cup', **options)

    # Whether or not amount is in cups.
    # @return [true, false]
    def cup? = unit == 'cup'

    # Converts the object to metric cups.
    # @return [Volume] the equivalent instance in metric cups
    def to_cup_metric(**options) = convert_to('cup-metric', **options)

    # Whether or not amount is in metric cups.
    # @return [true, false]
    def cup_metric? = unit == 'cup-metric'

    # Converts the object to dessert spoon.
    # @return [Volume] the equivalent instance in dessert spoon
    def to_dessert_spoon(**options) = convert_to('dessert-spoon', **options)

    # Whether or not amount is in dessert spoon.
    # @return [true, false]
    def dessert_spoon? = unit == 'dessert-spoon'

    # Converts the object to dram.
    # @return [Volume] the equivalent instance in dram
    def to_dram(**options) = convert_to('dram', **options)

    # Whether or not amount is in dram.
    # @return [true, false]
    def dram? = unit == 'dram'

    # Converts the object to drop.
    # @return [Volume] the equivalent instance in drop
    def to_drop(**options) = convert_to('drop', **options)

    # Whether or not amount is in drop.
    # @return [true, false]
    def drop? = unit == 'drop'

    # Converts the object to fluid ounces.
    # @return [Volume] the equivalent instance in fluid ounces
    def to_fluid_ounce(**options) = convert_to('fluid-ounce', **options)

    # Whether or not amount is in fluid ounces.
    # @return [true, false]
    def fluid_ounce? = unit == 'fluid-ounce'

    # Converts the object to Imp. fluid ounces.
    # @return [Volume] the equivalent instance in Imp. fluid ounces
    def to_fluid_ounce_imperial(**options) = convert_to('fluid-ounce-imperial', **options)

    # Whether or not amount is in Imp. fluid ounces.
    # @return [true, false]
    def fluid_ounce_imperial? = unit == 'fluid-ounce-imperial'

    # Converts the object to gallons.
    # @return [Volume] the equivalent instance in gallons
    def to_gallon(**options) = convert_to('gallon', **options)

    # Whether or not amount is in gallons.
    # @return [true, false]
    def gallon? = unit == 'gallon'

    alias_method :to_gal, :to_gallon
    alias_method :gal?, :gallon?

    # Converts the object to Imp. gallons.
    # @return [Volume] the equivalent instance in Imp. gallons
    def to_gallon_imperial(**options) = convert_to('gallon-imperial', **options)

    # Whether or not amount is in Imp. gallons.
    # @return [true, false]
    def gallon_imperial? = unit == 'gallon-imperial'

    # Converts the object to jigger.
    # @return [Volume] the equivalent instance in jigger
    def to_jigger(**options) = convert_to('jigger', **options)

    # Whether or not amount is in jigger.
    # @return [true, false]
    def jigger? = unit == 'jigger'

    # Converts the object to liters.
    # @return [Volume] the equivalent instance in liters
    def to_liter(**options) = convert_to('liter', **options)

    # Whether or not amount is in liters.
    # @return [true, false]
    def liter? = unit == 'liter'

    alias_method :to_L, :to_liter
    alias_method :L?, :liter?

    # Converts the object to pinch.
    # @return [Volume] the equivalent instance in pinch
    def to_pinch(**options) = convert_to('pinch', **options)

    # Whether or not amount is in pinch.
    # @return [true, false]
    def pinch? = unit == 'pinch'

    # Converts the object to pints.
    # @return [Volume] the equivalent instance in pints
    def to_pint(**options) = convert_to('pint', **options)

    # Whether or not amount is in pints.
    # @return [true, false]
    def pint? = unit == 'pint'

    # Converts the object to metric pints.
    # @return [Volume] the equivalent instance in metric pints
    def to_pint_metric(**options) = convert_to('pint-metric', **options)

    # Whether or not amount is in metric pints.
    # @return [true, false]
    def pint_metric? = unit == 'pint-metric'

    # Converts the object to quarts.
    # @return [Volume] the equivalent instance in quarts
    def to_quart(**options) = convert_to('quart', **options)

    # Whether or not amount is in quarts.
    # @return [true, false]
    def quart? = unit == 'quart'

    # Converts the object to Imp. quart.
    # @return [Volume] the equivalent instance in Imp. quart
    def to_quart_imperial(**options) = convert_to('quart-imperial', **options)

    # Whether or not amount is in Imp. quart.
    # @return [true, false]
    def quart_imperial? = unit == 'quart-imperial'

    # Converts the object to tablespoons.
    # @return [Volume] the equivalent instance in tablespoons
    def to_tablespoon(**options) = convert_to('tablespoon', **options)

    # Whether or not amount is in tablespoons.
    # @return [true, false]
    def tablespoon? = unit == 'tablespoon'

    # Converts the object to teaspoons.
    # @return [Volume] the equivalent instance in teaspoons
    def to_teaspoon(**options) = convert_to('teaspoon', **options)

    # Whether or not amount is in teaspoons.
    # @return [true, false]
    def teaspoon? = unit == 'teaspoon'

    # Converts the object to centiliters.
    # @return [Volume] the equivalent instance in centiliters
    def to_centiliter(**options) = convert_to('centiliter', **options)

    # Whether or not amount is in centiliters.
    # @return [true, false]
    def centiliter? = unit == 'centiliter'

    # Converts the object to cubic centimeters.
    # @return [Volume] the equivalent instance in cubic centimeters
    def to_cubic_centimeter(**options) = convert_to('cubic-centimeter', **options)

    # Whether or not amount is in cubic centimeters.
    # @return [true, false]
    def cubic_centimeter? = unit == 'cubic-centimeter'

    # Converts the object to cubic feet.
    # @return [Volume] the equivalent instance in cubic feet
    def to_cubic_foot(**options) = convert_to('cubic-foot', **options)

    # Whether or not amount is in cubic feet.
    # @return [true, false]
    def cubic_foot? = unit == 'cubic-foot'

    # Converts the object to cubic inches.
    # @return [Volume] the equivalent instance in cubic inches
    def to_cubic_inch(**options) = convert_to('cubic-inch', **options)

    # Whether or not amount is in cubic inches.
    # @return [true, false]
    def cubic_inch? = unit == 'cubic-inch'

    # Converts the object to cubic kilometers.
    # @return [Volume] the equivalent instance in cubic kilometers
    def to_cubic_kilometer(**options) = convert_to('cubic-kilometer', **options)

    # Whether or not amount is in cubic kilometers.
    # @return [true, false]
    def cubic_kilometer? = unit == 'cubic-kilometer'

    # Converts the object to cubic miles.
    # @return [Volume] the equivalent instance in cubic miles
    def to_cubic_mile(**options) = convert_to('cubic-mile', **options)

    # Whether or not amount is in cubic miles.
    # @return [true, false]
    def cubic_mile? = unit == 'cubic-mile'

    # Converts the object to cubic yards.
    # @return [Volume] the equivalent instance in cubic yards
    def to_cubic_yard(**options) = convert_to('cubic-yard', **options)

    # Whether or not amount is in cubic yards.
    # @return [true, false]
    def cubic_yard? = unit == 'cubic-yard'

    # Converts the object to deciliters.
    # @return [Volume] the equivalent instance in deciliters
    def to_deciliter(**options) = convert_to('deciliter', **options)

    # Whether or not amount is in deciliters.
    # @return [true, false]
    def deciliter? = unit == 'deciliter'

    # Converts the object to hectoliters.
    # @return [Volume] the equivalent instance in hectoliters
    def to_hectoliter(**options) = convert_to('hectoliter', **options)

    # Whether or not amount is in hectoliters.
    # @return [true, false]
    def hectoliter? = unit == 'hectoliter'

    # Converts the object to megaliters.
    # @return [Volume] the equivalent instance in megaliters
    def to_megaliter(**options) = convert_to('megaliter', **options)

    # Whether or not amount is in megaliters.
    # @return [true, false]
    def megaliter? = unit == 'megaliter'

    # Converts the object to milliliters.
    # @return [Volume] the equivalent instance in milliliters
    def to_milliliter(**options) = convert_to('milliliter', **options)

    # Whether or not amount is in milliliters.
    # @return [true, false]
    def milliliter? = unit == 'milliliter'

    # @return [Volume] self
    def to_volume = self
  end
end
