# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent digital values.
  # 
  # Supported Units:
  # * +bit+ (base unit)
  # * +byte+
  # * +gigabit+
  # * +gigabyte+
  # * +kilobit+
  # * +kilobyte+
  # * +megabit+
  # * +megabyte+
  # * +petabyte+
  # * +terabit+
  # * +terabyte+
  class Digital < GenericUnit
    self.quantity  =  'digital'
    self.base_unit =  'bit'
    self.units     =  {
      'byte'       => { factor: 8                    },
      'gigabit'    => { factor: 1000000000           },
      'gigabyte'   => { factor: 8r*1000000000r       },
      'kilobit'    => { factor: 1000                 },
      'kilobyte'   => { factor: 8r*1000r             },
      'megabit'    => { factor: 1000000              },
      'megabyte'   => { factor: 8r*1000000r          },
      'petabyte'   => { factor: 8r*1000000000000000r },
      'terabit'    => { factor: 1000000000000        },
      'terabyte'   => { factor: 8r*1000000000000r    },
      base_unit    => { factor: 1                    }}
    self.aliases   =  {}
    rules.divide   =  { Portion => Digital }
    rules.multiply =  { Portion => Digital }

    # Converts the object to bits.
    # @return [Digital] the equivalent instance in bits
    def to_bit(**options) = convert_to('bit', **options)

    # Whether or not amount is in bits.
    # @return [true, false]
    def bit? = unit == 'bit'

    # Converts the object to bytes.
    # @return [Digital] the equivalent instance in bytes
    def to_byte(**options) = convert_to('byte', **options)

    # Whether or not amount is in bytes.
    # @return [true, false]
    def byte? = unit == 'byte'

    # Converts the object to gigabits.
    # @return [Digital] the equivalent instance in gigabits
    def to_gigabit(**options) = convert_to('gigabit', **options)

    # Whether or not amount is in gigabits.
    # @return [true, false]
    def gigabit? = unit == 'gigabit'

    # Converts the object to gigabytes.
    # @return [Digital] the equivalent instance in gigabytes
    def to_gigabyte(**options) = convert_to('gigabyte', **options)

    # Whether or not amount is in gigabytes.
    # @return [true, false]
    def gigabyte? = unit == 'gigabyte'

    # Converts the object to kilobits.
    # @return [Digital] the equivalent instance in kilobits
    def to_kilobit(**options) = convert_to('kilobit', **options)

    # Whether or not amount is in kilobits.
    # @return [true, false]
    def kilobit? = unit == 'kilobit'

    # Converts the object to kilobytes.
    # @return [Digital] the equivalent instance in kilobytes
    def to_kilobyte(**options) = convert_to('kilobyte', **options)

    # Whether or not amount is in kilobytes.
    # @return [true, false]
    def kilobyte? = unit == 'kilobyte'

    # Converts the object to megabits.
    # @return [Digital] the equivalent instance in megabits
    def to_megabit(**options) = convert_to('megabit', **options)

    # Whether or not amount is in megabits.
    # @return [true, false]
    def megabit? = unit == 'megabit'

    # Converts the object to megabytes.
    # @return [Digital] the equivalent instance in megabytes
    def to_megabyte(**options) = convert_to('megabyte', **options)

    # Whether or not amount is in megabytes.
    # @return [true, false]
    def megabyte? = unit == 'megabyte'

    # Converts the object to petabytes.
    # @return [Digital] the equivalent instance in petabytes
    def to_petabyte(**options) = convert_to('petabyte', **options)

    # Whether or not amount is in petabytes.
    # @return [true, false]
    def petabyte? = unit == 'petabyte'

    # Converts the object to terabits.
    # @return [Digital] the equivalent instance in terabits
    def to_terabit(**options) = convert_to('terabit', **options)

    # Whether or not amount is in terabits.
    # @return [true, false]
    def terabit? = unit == 'terabit'

    # Converts the object to terabytes.
    # @return [Digital] the equivalent instance in terabytes
    def to_terabyte(**options) = convert_to('terabyte', **options)

    # Whether or not amount is in terabytes.
    # @return [true, false]
    def terabyte? = unit == 'terabyte'

    # @return [Digital] self
    def to_digital = self
  end
end
