# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent power values.
  # 
  # Supported Units:
  # * +horsepower+
  # * +kilogram-square-meter-per-cubic-second+ (base unit)
  # * +solar-luminosity+
  # * +watt+
  # * +gigawatt+
  # * +kilowatt+
  # * +megawatt+
  # * +milliwatt+
  class Power < GenericUnit
    self.quantity        =  'power'
    self.base_unit       =  'kilogram-square-meter-per-cubic-second'
    self.units           =  {
      'gigawatt'         => { systems: ["metric", "si"], factor: 1000000000 },
      'horsepower'       => { factor: CONSTANTS[:ft_to_m]*CONSTANTS[:lb_to_kg]*CONSTANTS[:gravity]*550r, systems: ["ussystem", "uksystem"] },
      'kilowatt'         => { systems: ["metric", "si"], factor: 1000 },
      'megawatt'         => { systems: ["metric", "si"], factor: 1000000 },
      'milliwatt'        => { systems: ["metric", "si"], factor: 1r/1000r },
      'solar-luminosity' => { factor: '3.828E+26'.to_r },
      'watt'             => { systems: ["metric", "si"], factor: 1 },
      base_unit          => { factor: 1 }}
    self.aliases         =  {}
    rules.divide         =  { Portion => Power, Force => Speed, Speed => Force, Torque => Speed, Speed => Torque }
    rules.multiply       =  { Portion => Power, Duration => Energy }

    # Converts the object to horsepower.
    # @return [Power] the equivalent instance in horsepower
    def to_horsepower(**options) = convert_to('horsepower', **options)

    # Whether or not amount is in horsepower.
    # @return [true, false]
    def horsepower? = unit == 'horsepower'

    # Converts the object to solar luminosities.
    # @return [Power] the equivalent instance in solar luminosities
    def to_solar_luminosity(**options) = convert_to('solar-luminosity', **options)

    # Whether or not amount is in solar luminosities.
    # @return [true, false]
    def solar_luminosity? = unit == 'solar-luminosity'

    # Converts the object to watts.
    # @return [Power] the equivalent instance in watts
    def to_watt(**options) = convert_to('watt', **options)

    # Whether or not amount is in watts.
    # @return [true, false]
    def watt? = unit == 'watt'

    # Converts the object to gigawatts.
    # @return [Power] the equivalent instance in gigawatts
    def to_gigawatt(**options) = convert_to('gigawatt', **options)

    # Whether or not amount is in gigawatts.
    # @return [true, false]
    def gigawatt? = unit == 'gigawatt'

    # Converts the object to kilowatts.
    # @return [Power] the equivalent instance in kilowatts
    def to_kilowatt(**options) = convert_to('kilowatt', **options)

    # Whether or not amount is in kilowatts.
    # @return [true, false]
    def kilowatt? = unit == 'kilowatt'

    # Converts the object to megawatts.
    # @return [Power] the equivalent instance in megawatts
    def to_megawatt(**options) = convert_to('megawatt', **options)

    # Whether or not amount is in megawatts.
    # @return [true, false]
    def megawatt? = unit == 'megawatt'

    # Converts the object to milliwatts.
    # @return [Power] the equivalent instance in milliwatts
    def to_milliwatt(**options) = convert_to('milliwatt', **options)

    # Whether or not amount is in milliwatts.
    # @return [true, false]
    def milliwatt? = unit == 'milliwatt'

    # @return [Power] self
    def to_power = self
  end
end
