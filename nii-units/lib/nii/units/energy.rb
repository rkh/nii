# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent energy values.
  # 
  # Supported Units:
  # * +british-thermal-unit+
  # * +calorie+
  # * +dalton+
  # * +electronvolt+
  # * +foodcalorie+
  # * +joule+
  # * +kilogram-square-meter-per-square-second+ (base unit)
  # * +therm-us+
  # * +kilocalorie+
  # * +kilojoule+
  class Energy < GenericUnit
    self.quantity  =  'energy'
    self.base_unit =  'kilogram-square-meter-per-square-second'
    self.units     =  {
      'british-thermal-unit' => { factor: 4.184r*2267.96185r/9r, systems: ["ussystem", "uksystem"] },
      'calorie'              => { factor: 4.184r },
      'dalton'               => { factor: '1.49241808560E-10'.to_r },
      'electronvolt'         => { factor: '1.602177E-19'.to_r },
      'foodcalorie'          => { factor: 4184, systems: ["ussystem", "uksystem"], symbol: 'Cal' },
      'joule'                => { systems: ["metric", "si"], factor: 1 },
      'kilocalorie'          => { factor: 4.184r*1000r },
      'kilojoule'            => { systems: ["metric", "si"], factor: 1000 },
      'therm-us'             => { factor: 105480400, systems: ["ussystem"] },
      base_unit              => { factor: 1 }}
    self.aliases   =  { 'Cal' => 'foodcalorie' }
    rules.divide   =  { Portion => Energy, Force => Length, Length => Force, Power => Duration, Duration => Power }
    rules.multiply =  { Portion => Energy }

    # Converts the object to British thermal units.
    # @return [Energy] the equivalent instance in British thermal units
    def to_british_thermal_unit(**options) = convert_to('british-thermal-unit', **options)

    # Whether or not amount is in British thermal units.
    # @return [true, false]
    def british_thermal_unit? = unit == 'british-thermal-unit'

    # Converts the object to calories.
    # @return [Energy] the equivalent instance in calories
    def to_calorie(**options) = convert_to('calorie', **options)

    # Whether or not amount is in calories.
    # @return [true, false]
    def calorie? = unit == 'calorie'

    # Converts the object to daltons.
    # @return [Energy] the equivalent instance in daltons
    def to_dalton(**options) = convert_to('dalton', **options)

    # Whether or not amount is in daltons.
    # @return [true, false]
    def dalton? = unit == 'dalton'

    # Converts the object to electronvolts.
    # @return [Energy] the equivalent instance in electronvolts
    def to_electronvolt(**options) = convert_to('electronvolt', **options)

    # Whether or not amount is in electronvolts.
    # @return [true, false]
    def electronvolt? = unit == 'electronvolt'

    # Converts the object to Calories.
    # @return [Energy] the equivalent instance in Calories
    def to_foodcalorie(**options) = convert_to('foodcalorie', **options)

    # Whether or not amount is in Calories.
    # @return [true, false]
    def foodcalorie? = unit == 'foodcalorie'

    alias_method :to_Cal, :to_foodcalorie
    alias_method :Cal?, :foodcalorie?

    # Converts the object to joules.
    # @return [Energy] the equivalent instance in joules
    def to_joule(**options) = convert_to('joule', **options)

    # Whether or not amount is in joules.
    # @return [true, false]
    def joule? = unit == 'joule'

    # Converts the object to US therms.
    # @return [Energy] the equivalent instance in US therms
    def to_therm_us(**options) = convert_to('therm-us', **options)

    # Whether or not amount is in US therms.
    # @return [true, false]
    def therm_us? = unit == 'therm-us'

    # Converts the object to kilocalories.
    # @return [Energy] the equivalent instance in kilocalories
    def to_kilocalorie(**options) = convert_to('kilocalorie', **options)

    # Whether or not amount is in kilocalories.
    # @return [true, false]
    def kilocalorie? = unit == 'kilocalorie'

    # Converts the object to kilojoules.
    # @return [Energy] the equivalent instance in kilojoules
    def to_kilojoule(**options) = convert_to('kilojoule', **options)

    # Whether or not amount is in kilojoules.
    # @return [true, false]
    def kilojoule? = unit == 'kilojoule'

    # @return [Energy] self
    def to_energy = self
  end
end
