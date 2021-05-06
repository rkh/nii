# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent portion values.
  # 
  # Supported Units:
  # * +karat+
  # * +percent+
  # * +permille+
  # * +permillion+
  # * +permyriad+
  # * +portion+ (base unit)
  class Portion < GenericUnit
    self.quantity  =  'portion'
    self.base_unit =  'portion'
    self.units     =  {
      'karat'      => { factor: 1r/24r      },
      'percent'    => { factor: 1r/100r     },
      'permille'   => { factor: 1r/1000r    },
      'permillion' => { factor: 1r/1000000r },
      'permyriad'  => { factor: 1r/10000r   },
      base_unit    => { factor: 1           }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Portion }
    rules.multiply =  { 
      Acceleration          => Acceleration, 
      Angle                 => Angle, 
      Area                  => Area, 
      Concentration         => Concentration, 
      ConcentrationMass     => ConcentrationMass, 
      Consumption           => Consumption, 
      CurrentDensity        => CurrentDensity, 
      Digital               => Digital, 
      Dose                  => Dose, 
      Duration              => Duration, 
      ElectricCapacitance   => ElectricCapacitance, 
      ElectricCharge        => ElectricCharge, 
      ElectricConductance   => ElectricConductance, 
      ElectricCurrent       => ElectricCurrent, 
      ElectricInductance    => ElectricInductance, 
      ElectricResistance    => ElectricResistance, 
      Energy                => Energy, 
      Force                 => Force, 
      Frequency             => Frequency, 
      Graphics              => Graphics, 
      Illuminance           => Illuminance, 
      Length                => Length, 
      LuminousFlux          => LuminousFlux, 
      LuminousIntensity     => LuminousIntensity, 
      MagneticFieldStrength => MagneticFieldStrength, 
      MagneticFlux          => MagneticFlux, 
      MagneticInduction     => MagneticInduction, 
      Mass                  => Mass, 
      MassDensity           => MassDensity, 
      MassFraction          => MassFraction, 
      Portion               => Portion, 
      Power                 => Power, 
      Pressure              => Pressure, 
      PressurePerLength     => PressurePerLength, 
      Resolution            => Resolution, 
      SolidAngle            => SolidAngle, 
      SpecificVolume        => SpecificVolume, 
      Speed                 => Speed, 
      SubstanceAmount       => SubstanceAmount, 
      Temperature           => Temperature, 
      Typewidth             => Typewidth, 
      Voltage               => Voltage, 
      Volume                => Volume, 
      WaveNumber            => WaveNumber, 
      YearDuration          => YearDuration }

    # Converts the object to karats.
    # @return [Portion] the equivalent instance in karats
    def to_karat(**options) = convert_to('karat', **options)

    # Whether or not amount is in karats.
    # @return [true, false]
    def karat? = unit == 'karat'

    # Converts the object to percent.
    # @return [Portion] the equivalent instance in percent
    def to_percent(**options) = convert_to('percent', **options)

    # Whether or not amount is in percent.
    # @return [true, false]
    def percent? = unit == 'percent'

    # Converts the object to permille.
    # @return [Portion] the equivalent instance in permille
    def to_permille(**options) = convert_to('permille', **options)

    # Whether or not amount is in permille.
    # @return [true, false]
    def permille? = unit == 'permille'

    # Converts the object to parts per million.
    # @return [Portion] the equivalent instance in parts per million
    def to_permillion(**options) = convert_to('permillion', **options)

    # Whether or not amount is in parts per million.
    # @return [true, false]
    def permillion? = unit == 'permillion'

    # Converts the object to permyriad.
    # @return [Portion] the equivalent instance in permyriad
    def to_permyriad(**options) = convert_to('permyriad', **options)

    # Whether or not amount is in permyriad.
    # @return [true, false]
    def permyriad? = unit == 'permyriad'

    # Converts the object to portion.
    # @return [Portion] the equivalent instance in portion
    def to_portion(**options) = convert_to('portion', **options)

    # Whether or not amount is in portion.
    # @return [true, false]
    def portion? = unit == 'portion'
  end
end
