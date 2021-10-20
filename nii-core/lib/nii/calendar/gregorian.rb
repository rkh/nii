# frozen_string_literal: true

module Nii::Calendar
  # The Julian and Gregorian calendar systems.
  class Gregorian < Generic
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    # @see Nii::Calendar::Generic#year
    def year(date) = date(date).year

    # Returns 0 for BCE date, 1 for CE dates.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer, nil]
    # @see Nii::Date#era
    def era(date) = year(date).positive? ? 1 : 0

    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's quarter for a given date
    # @see Nii::Date#quarter
    # @see Nii::Calendar::Generic#quarter
    def quarter(date) = month(date) / 3

    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's month for a given date
    # @see Nii::Date#month
    # @see Nii::Calendar::Generic#month
    def month(date) = date(date).month

    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of a month for a given date
    # @see Nii::Date#day
    # @see Nii::Calendar::Generic#day
    def day(date) = date(date).day

    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of a month for a given date
    # @see Nii::Date#day
    # @see Nii::Calendar::Generic#day
    def day_of_year(date) = date(date).yday

    # Calculates the Gregorian date of the new year.
    #
    # @overload new_year(year)
    #   @param year [Integer] Gregorian year
    #   @return [::Date] Gregorian date of the new year within the Gregorian year
    #
    # @overload new_year(date)
    #   @param date [Time, Date, ::Nii::Date, #to_date, #to_nii_date] A date or time
    #   @return [::Date] Gregorian date of the first day of the year the date is part of
    #
    # @see Nii::Calendar::Generic#new_year
    def new_year(date) = ::Date.new(Integer === date ? date : date(date).year, 1, 1, reform_jd).new_start(::Date::GREGORIAN)

    # Nii considers a year a leap year if it has a different number of days from normal years.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's year is a leap year
    # @see Nii::Date#leap_year?
    # @see Nii::Calendar::Generic#leap_year?
    # @note This is not the same as Ruby's ::Date#leap? method, which is the only ::Date method that ignores calendar reform.
    def leap_year?(date) = julio_gregorian_leap_year?(date)

    # Nii considers a day a leap day if it doesn't occur in a normal year.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's month is a leap month
    # @see Nii::Date#leap_day?
    # @see Nii::Calendar::Generic#leap_day?
    def leap_day?(date)
      date = date(date)
      date.month == 2 and date.day > 28
    end

    # @api internal
    def format(date) = date(date).to_s

    # @api internal
    def data_key = :gregorian
  end
end
