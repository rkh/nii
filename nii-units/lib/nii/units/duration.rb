# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent duration values.
  # 
  # Supported Units:
  # * +day+
  # * +day-person+
  # * +hour+
  # * +minute+
  # * +second+ (base unit)
  # * +week+
  # * +week-person+
  # * +microsecond+
  # * +millisecond+
  # * +nanosecond+
  class Duration < GenericUnit
    self.quantity   =  'duration'
    self.base_unit  =  'second'
    self.units      =  {
      'day'         => { factor: 86400, symbol: 'days' },
      'day-person'  => { factor: 86400                 },
      'hour'        => { factor: 3600, symbol: 'hr'    },
      'microsecond' => { factor: 1r/1000000r           },
      'millisecond' => { factor: 1r/1000r              },
      'minute'      => { factor: 60                    },
      'nanosecond'  => { factor: 1r/1000000000r        },
      'week'        => { factor: 604800, symbol: 'wks' },
      'week-person' => { factor: 604800                },
      base_unit     => { factor: 1, symbol: 'sec'      }}
    self.aliases    =  {
      'days'        => 'day',
      'hr'          => 'hour',
      'sec'         => 'second',
      'wks'         => 'week'}
    rules.divide    =  { Portion => Duration }
    rules.multiply  =  { Portion => Duration, Acceleration => Speed, ElectricCurrent => ElectricCharge, ElectricResistance => ElectricInductance, Frequency => Angle, Power => Energy }

    # Converts the object to days.
    # @return [Duration] the equivalent instance in days
    def to_day(**options) = convert_to('day', **options)

    # Whether or not amount is in days.
    # @return [true, false]
    def day? = unit == 'day'

    alias_method :to_days, :to_day
    alias_method :days?, :day?

    # Converts the object to day-person.
    # @return [Duration] the equivalent instance in day-person
    def to_day_person(**options) = convert_to('day-person', **options)

    # Whether or not amount is in day-person.
    # @return [true, false]
    def day_person? = unit == 'day-person'

    # Converts the object to hours.
    # @return [Duration] the equivalent instance in hours
    def to_hour(**options) = convert_to('hour', **options)

    # Whether or not amount is in hours.
    # @return [true, false]
    def hour? = unit == 'hour'

    alias_method :to_hr, :to_hour
    alias_method :hr?, :hour?

    # Converts the object to minutes.
    # @return [Duration] the equivalent instance in minutes
    def to_minute(**options) = convert_to('minute', **options)

    # Whether or not amount is in minutes.
    # @return [true, false]
    def minute? = unit == 'minute'

    # Converts the object to seconds.
    # @return [Duration] the equivalent instance in seconds
    def to_second(**options) = convert_to('second', **options)

    # Whether or not amount is in seconds.
    # @return [true, false]
    def second? = unit == 'second'

    alias_method :to_sec, :to_second
    alias_method :sec?, :second?

    # Converts the object to weeks.
    # @return [Duration] the equivalent instance in weeks
    def to_week(**options) = convert_to('week', **options)

    # Whether or not amount is in weeks.
    # @return [true, false]
    def week? = unit == 'week'

    alias_method :to_wks, :to_week
    alias_method :wks?, :week?

    # Converts the object to week-person.
    # @return [Duration] the equivalent instance in week-person
    def to_week_person(**options) = convert_to('week-person', **options)

    # Whether or not amount is in week-person.
    # @return [true, false]
    def week_person? = unit == 'week-person'

    # Converts the object to microseconds.
    # @return [Duration] the equivalent instance in microseconds
    def to_microsecond(**options) = convert_to('microsecond', **options)

    # Whether or not amount is in microseconds.
    # @return [true, false]
    def microsecond? = unit == 'microsecond'

    # Converts the object to milliseconds.
    # @return [Duration] the equivalent instance in milliseconds
    def to_millisecond(**options) = convert_to('millisecond', **options)

    # Whether or not amount is in milliseconds.
    # @return [true, false]
    def millisecond? = unit == 'millisecond'

    # Converts the object to nanoseconds.
    # @return [Duration] the equivalent instance in nanoseconds
    def to_nanosecond(**options) = convert_to('nanosecond', **options)

    # Whether or not amount is in nanoseconds.
    # @return [true, false]
    def nanosecond? = unit == 'nanosecond'

    # @return [Duration] self
    def to_duration = self
  end
end
