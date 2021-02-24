# frozen_string_literal: true

module Nii::Calendar
  # The French Republican calendar.
  class Revolutionary < Generic
    include Nii::Calendars::LocationHelpers

    # @api internal
    UTC_OFFSET = 561 # Paris Mean Time is 9 minutes and 21 seconds ahead of GMT

    # Calculates the Republican New Year.
    #
    # @overload new_year(year)
    #   @param year [Integer] Gregorian year
    #   @return [::Date] Gregorian date of the new year within the Gregorian year
    #
    # @overload new_year(date)
    #   @param date [Time, Date, ::Nii::Date, #to_date, #to_nii_date] A date or time
    #   @return [::Date] Gregorian date of the first day of the year the date is part of
    def new_year(input)
      equinox = Integer === input ? @astro.solar_event(:september_equinox, input) : @astro.previous(:september_equinox, end_of_day(input))
      local_date(equinox)
    end

    # Republican year for a given date.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    def year(input) = new_year(input).year - 1791

    # Month from 1 to 12 for the 12 months, or 13 for the complementary days at the end of the year.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's month for a given date
    # @see Nii::Date#year
    # @see Nii::Calendar::Generic#quarter
    def month(input) = (day_of_year(input) - 1) / 30 + 1

    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of the month for a given date.
    # @see Nii::Date#month
    # @see Nii::Calendar::Gerneric#month
    def day(input) = (day_of_year(input) - 1) % 30 + 1

    # Whether the year has five (false) or six (true) complimentary days.
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

    # @api internal
    def format(input)
      month = month(input)
      year  = data.numbering_system(:roman).format(year(input))
      "#{year} #{month == 13 ? 'compl. ' : "#{month}-"}#{day(input)}"
    end
  end
end
