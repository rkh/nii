# frozen_string_literal: true

module Nii::Calendar
  # The Solar Hijri calendar system used in Iran and Afghanistan.
  #
  # @note
  #   * The starting year change that was in effect from 1976 to 1979 is ignored. Year numbers are therefore unique.
  #   * The actual March equinox is used (as opposed to the Birashk leap year algorithm or the 33 year cycle). Dates are always correct.
  class Persian < Generic
    include Nii::Calendars::LocationHelpers

    # @api internal
    UTC_OFFSET = '+03:30'

    # Calculates the Iranian New Year.
    # The new year is on the day of the first noon in Iranian Standard Time after the March equinox.
    #
    # @overload new_year(year)
    #   @param year [Integer] Gregorian year
    #   @return [::Date] Gregorian date of the new year within the Gregorian year
    #
    # @overload new_year(date)
    #   @param date [Time, Date, ::Nii::Date, #to_date, #to_nii_date] A date or time
    #   @return [::Date] Gregorian date of the first day of the year the date is part of
    def new_year(input)
      equinox = Integer === input ? @astro.solar_event(:march_equinox, input) : @astro.previous(:march_equinox, input)
      date    = local_date(equinox)
      equinox.localtime(utc_offset).hour < 12 ? date : date + 1
    end

    # Hijri year for a given date.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    def year(input) = new_year(input).year - 621

    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's month for a given date
    # @see Nii::Date#year
    # @see Nii::Calendar::Generic#quarter
    def month(input)
      days = day_of_year(input) - 1
      days > 185 ? (days - 186) / 30 + 7 : days / 31 + 1
    end

    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of the month for a given date.
    # @see Nii::Date#month
    # @see Nii::Calendar::Gerneric#month
    def day(input)
      days = day_of_year(input) - 1
      days > 185 ? (days - 186) % 30 + 1 : days % 31 + 1
    end

    # Whether or not the the year has an additional 30th day in the 12th month.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question.
    # @return [true, false] whether the date's year is a leap year.
    # @see Nii::Date#leap_year?
    def leap_year?(input)
      new_year = new_year(input)
      new_year(new_year.year + 1) - new_year > 365
    end

    # Nii considers a day a leap day if it doesn't occur in a normal year.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's month is a leap month
    # @see Nii::Date#leap_day?
    # @see Nii::Calendar::Generic#leap_day?
    def leap_day?(input) = day_of_year(input) > 365
  end
end
