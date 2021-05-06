# Nii-Units

## Features

* Great coverage
  * Includes all units defined in the comprehensive Unicode Common Locale Data Repository.
  * Straightforward interface to add your own units, both globally and locally.
* Full arithmetic support
  * Automatic unit conversion (including for more complex scenarios, like `Length ⨉ Area = Volume`).
  * Proper handing of offsets and deltas (so you can do temperature calculations).
  * Proper handling of inversely proportional units.
  * Complete, unit aware implementation of Ruby's Numeric protocol.
  * Lossless conversion to avoid precision errors (converting X into Y and back into X is guaranteed to result in the same value).
* Simple and robust internals
  * One class per quantity (unit category), one super class for all units, one instance per value.
  * No dynamic class generation or runtime meta programming.
* Non-invasive
  * Does not extend or modify any objects outside its own namespace.
  * Does not introduce any additional dependencies.
* Integrates seamlessly with [Nii](https://github.com/rkh/nii) for automatic and advanced localization.

## Usage

``` ruby
require 'nii/units'
include Nii::Units

a = Temperature['10°F']
b = Temperature['10°C']
c = a - b

if a > b
  puts "Fahrenheit is higher (#{a} = #{a.in(:celsius)})."
else
  puts "Celsius is higher (#{b} = #{b.in(:fahrenheit)})."
end

puts "The difference is #{c.abs}."
```

## Formatting and Localization

… TODO …

## Supported Units

<!-- start generated -->
 Quantity / Class        | Base Unit                                        | Supported Units
-------------------------|--------------------------------------------------|-------------------------
 `Acceleration`          |  `meter-per-square-second`                        |  `g-force`
 `Angle`                 |  `revolution`                                     |  `arc-minute`, `arc-second`, `degree`, `radian`
 `Area`                  |  `square-meter`                                   |  `acre`, `dunam`, `hectare`, `square-inch`, `square-centimeter`, `square-foot`, `square-kilometer`, `square-mile`, `square-yard`
 `Concentration`         |  `item-per-cubic-meter`                           | 
 `ConcentrationMass`     |  `item-per-kilogram`                              |  `ofglucose`
 `Consumption`           |  `cubic-meter-per-meter`                          | 
 `CurrentDensity`        |  `ampere-per-square-meter`                        | 
 `Digital`               |  `bit`                                            |  `byte`, `gigabit`, `gigabyte`, `kilobit`, `kilobyte`, `megabit`, `megabyte`, `petabyte`, `terabit`, `terabyte`
 `Dose`                  |  `square-meter-per-square-second`                 | 
 `Duration`              |  `second`                                         |  `day`, `day-person`, `hour`, `minute`, `week`, `week-person`, `microsecond`, `millisecond`, `nanosecond`
 `ElectricCapacitance`   |  `pow4-second-square-ampere-per-kilogram-square-meter` | 
 `ElectricCharge`        |  `second-ampere`                                  | 
 `ElectricConductance`   |  `cubic-second-square-ampere-per-kilogram-square-meter` | 
 `ElectricCurrent`       |  `ampere`                                         |  `milliampere`
 `ElectricInductance`    |  `kilogram-square-meter-per-square-second-square-ampere` | 
 `ElectricResistance`    |  `kilogram-square-meter-per-cubic-second-square-ampere` |  `ohm`
 `Energy`                |  `kilogram-square-meter-per-square-second`        |  `british-thermal-unit`, `calorie`, `dalton`, `electronvolt`, `foodcalorie`, `joule`, `therm-us`, `kilocalorie`, `kilojoule`
 `Force`                 |  `kilogram-meter-per-square-second`               |  `newton`, `pound-force`
 `Frequency`             |  `revolution-per-second`                          |  `hertz`, `gigahertz`, `kilohertz`, `megahertz`
 `Graphics`              |  `pixel`                                          |  `dot`, `megapixel`
 `Illuminance`           |  `candela-per-square-meter`                       |  `lux`
 `Length`                |  `meter`                                          |  `100-kilometer`, `astronomical-unit`, `earth-radius`, `fathom`, `foot`, `furlong`, `inch`, `light-year`, `mile`, `mile-scandinavian`, `nautical-mile`, `parsec`, `point`, `solar-radius`, `yard`, `centimeter`, `kilometer`, `decimeter`, `micrometer`, `millimeter`, `nanometer`, `picometer`
 `LuminousFlux`          |  `candela-square-meter-per-square-meter`          |  `lumen`
 `LuminousIntensity`     |  `candela`                                        | 
 `MagneticFieldStrength` |  `ampere-per-meter`                               | 
 `MagneticFlux`          |  `kilogram-square-meter-per-square-second-ampere` | 
 `MagneticInduction`     |  `kilogram-per-square-second-ampere`              | 
 `Mass`                  |  `kilogram`                                       |  `carat`, `earth-mass`, `grain`, `gram`, `metric-ton`, `ounce`, `ounce-troy`, `pound`, `solar-mass`, `stone`, `ton`, `microgram`, `milligram`
 `MassDensity`           |  `kilogram-per-cubic-meter`                       | 
 `MassFraction`          |  `kilogram-per-kilogram`                          | 
 `Portion`               |  `portion`                                        |  `karat`, `percent`, `permille`, `permillion`, `permyriad`
 `Power`                 |  `kilogram-square-meter-per-cubic-second`         |  `horsepower`, `solar-luminosity`, `watt`, `gigawatt`, `kilowatt`, `megawatt`, `milliwatt`
 `Pressure`              |  `kilogram-per-meter-square-second`               |  `atmosphere`, `bar`, `pascal`, `hectopascal`, `kilopascal`, `megapascal`, `millibar`
 `PressurePerLength`     |  `kilogram-per-square-meter-square-second`        |  `ofhg`
 `Resolution`            |  `pixel-per-meter`                                |  `dot-per-centimeter`, `dot-per-inch`
 `SolidAngle`            |  `square-revolution`                              | 
 `SpecificVolume`        |  `cubic-meter-per-kilogram`                       | 
 `Speed`                 |  `meter-per-second`                               |  `knot`
 `SubstanceAmount`       |  `item`                                           |  `mole`, `millimole`
 `Temperature`           |  `kelvin`                                         |  `celsius`, `fahrenheit`
 `Typewidth`             |  `em`                                             | 
 `Voltage`               |  `kilogram-square-meter-per-cubic-second-ampere`  |  `volt`
 `Volume`                |  `cubic-meter`                                    |  `barrel`, `bushel`, `cup`, `cup-metric`, `dessert-spoon`, `dessert-spoon-imperial`, `dram`, `drop`, `fluid-ounce`, `fluid-ounce-imperial`, `gallon`, `gallon-imperial`, `jigger`, `liter`, `pinch`, `pint`, `pint-metric`, `quart`, `quart-imperial`, `tablespoon`, `teaspoon`, `centiliter`, `cubic-centimeter`, `cubic-foot`, `cubic-inch`, `cubic-kilometer`, `cubic-mile`, `cubic-yard`, `deciliter`, `hectoliter`, `megaliter`, `milliliter`
 `WaveNumber`            |  `revolution-per-meter`                           | 
 `YearDuration`          |  `year`                                           |  `century`, `decade`, `month`, `month-person`, `year-person`
<!-- end generated -->

## Similar Projects

General purpose Ruby libraries:
* [ruby-units](https://github.com/olbrich/ruby-units)
* [measured](https://github.com/Shopify/measured) and [quanitifed](https://github.com/Shopify/quantified) by Shopify
* [unitwise](https://github.com/joshwlewis/unitwise)
* [m9t](https://github.com/joeyates/m9t)
