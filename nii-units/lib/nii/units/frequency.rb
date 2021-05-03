# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent frequency values.
  # 
  # Supported Units:
  # * +hertz+
  # * +revolution-per-second+ (base unit)
  # * +gigahertz+
  # * +kilohertz+
  # * +megahertz+
  class Frequency < GenericUnit
    self.quantity  =  'frequency'
    self.base_unit =  'revolution-per-second'
    self.units     =  {
      'gigahertz'  => { factor: 1000000000 },
      'hertz'      => { factor: 1          },
      'kilohertz'  => { factor: 1000       },
      'megahertz'  => { factor: 1000000    },
      base_unit    => { factor: 1          }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Frequency }
    rules.multiply =  { Portion => Frequency, Duration => Angle }

    # Converts the object to hertz.
    # @return [Frequency] the equivalent instance in hertz
    def to_hertz(**options) = convert_to('hertz', **options)

    # Whether or not amount is in hertz.
    # @return [true, false]
    def hertz? = unit == 'hertz'

    # Converts the object to gigahertz.
    # @return [Frequency] the equivalent instance in gigahertz
    def to_gigahertz(**options) = convert_to('gigahertz', **options)

    # Whether or not amount is in gigahertz.
    # @return [true, false]
    def gigahertz? = unit == 'gigahertz'

    # Converts the object to kilohertz.
    # @return [Frequency] the equivalent instance in kilohertz
    def to_kilohertz(**options) = convert_to('kilohertz', **options)

    # Whether or not amount is in kilohertz.
    # @return [true, false]
    def kilohertz? = unit == 'kilohertz'

    # Converts the object to megahertz.
    # @return [Frequency] the equivalent instance in megahertz
    def to_megahertz(**options) = convert_to('megahertz', **options)

    # Whether or not amount is in megahertz.
    # @return [true, false]
    def megahertz? = unit == 'megahertz'

    # @return [Frequency] self
    def to_frequency = self
  end
end
