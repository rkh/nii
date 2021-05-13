# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # Instances of this class represent year duration values.
  # 
  # Supported Units:
  # * +century+
  # * +decade+
  # * +month+
  # * +month-person+
  # * +year+ (base unit)
  # * +year-person+
  class YearDuration < GenericUnit
    self.quantity    =  'year-duration'
    self.base_unit   =  'year'
    self.units       =  {
      'century'      => { factor: 100                    },
      'decade'       => { factor: 10                     },
      'month'        => { factor: 1r/12r, symbol: 'mths' },
      'month-person' => { factor: 1r/12r                 },
      'year-person'  => { factor: 1                      },
      base_unit      => { factor: 1, symbol: 'yrs'       }}
    self.aliases     =  {
      'mths'         => 'month',
      'yrs'          => 'year'}
    rules.divide     =  { :Portion => :YearDuration }
    rules.multiply   =  { :Portion => :YearDuration }

    # Converts the object to centuries.
    # @return [YearDuration] the equivalent instance in centuries
    def to_century(**options) = convert_to('century', **options)

    # Whether or not amount is in centuries.
    # @return [true, false]
    def century? = unit == 'century'

    # Converts the object to decades.
    # @return [YearDuration] the equivalent instance in decades
    def to_decade(**options) = convert_to('decade', **options)

    # Whether or not amount is in decades.
    # @return [true, false]
    def decade? = unit == 'decade'

    # Converts the object to months.
    # @return [YearDuration] the equivalent instance in months
    def to_month(**options) = convert_to('month', **options)

    # Whether or not amount is in months.
    # @return [true, false]
    def month? = unit == 'month'

    alias_method :to_mths, :to_month
    alias_method :mths?, :month?

    # Converts the object to month-person.
    # @return [YearDuration] the equivalent instance in month-person
    def to_month_person(**options) = convert_to('month-person', **options)

    # Whether or not amount is in month-person.
    # @return [true, false]
    def month_person? = unit == 'month-person'

    # Converts the object to years.
    # @return [YearDuration] the equivalent instance in years
    def to_year(**options) = convert_to('year', **options)

    # Whether or not amount is in years.
    # @return [true, false]
    def year? = unit == 'year'

    alias_method :to_yrs, :to_year
    alias_method :yrs?, :year?

    # Converts the object to year-person.
    # @return [YearDuration] the equivalent instance in year-person
    def to_year_person(**options) = convert_to('year-person', **options)

    # Whether or not amount is in year-person.
    # @return [true, false]
    def year_person? = unit == 'year-person'

    # @return [YearDuration] self
    def to_year_duration = self
  end
end
