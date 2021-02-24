# frozen_string_literal: true

module Nii::Calendar
  # The Chinese calendar system.
  class Chinese < Generic
    include Nii::Calendars::LocationHelpers

    # @api internal
    UTC_OFFSET = '+08:00'

    # Calculates the Chinese New Year.
    #
    # @overload new_year(year)
    #   @param year [Integer] Gregorian year
    #   @return [::Date] Gregorian date of the Chinese new year within the Gregorian year
    #
    # @overload new_year(date)
    #   @param date [Time, Date, ::Nii::Date, #to_date, #to_nii_date] A date or time
    #   @return [::Date] Gregorian date of the first day of the Chinese year the date is part of
    def new_year(input)
      if input.is_a? Integer
        # This would be neat (as it doens't rely on implicit knowledge about the Gregorian calendar):
        #   solstice = @astro.solar_event(:december_solstice, input - 1)
        #   local_date @astro.next(:new_moon, solstice, offset: 1)
        # … but it doesn't account for a leap month after the winter solstice.
        first_possible = Time.new(input, 1, 21, 0, 0, 0, utc_offset)
        local_date @astro.next(:new_moon, first_possible, match: true)
      else
        date     = date(input)
        possible = new_year(date.year)
        possible > date ? new_year(date.year - 1) : possible
      end
    end

    # Gregorian year of the new year.
    # If you want the cyclic Chinese year, use {#cycle}.
    #
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    def year(input) = new_year(input).year

    # @note Leap months are counted as part of the same quarter as the previous month.
    #   This "leap" quarter will have an additional moon cycle and therefore be longer than the other quarters.
    #
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    # @see Nii::Calendar::Generic#quarter
    def quarter(input) = month(input) / 3

    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's month for a given date.
    # @see Nii::Date#month
    # @see Nii::Calendar::Gerneric#month
    def month(input)
      # Hi there. You might be thinking we should actually be counting new moons
      # instead of solar terms. This is mainly a lunar calendar after all, right?
      # You are correct.
      #
      # But then we'd check for a leap month. You can check for a leap month by checking
      # if the number of solar terms is smaller than the number of new moons. If so, the lunar
      # month that doesn't have a solar term in it and every subsequent month will have one
      # substracted from the number. So you'll have to check if solar term count is one less
      # than new moon count and and if so you have to substract one from the new moon count
      # … which is equal to the solar term count.
      date  = date(input)
      first = start_of_day(new_year(input))
      last  = @astro.next(:new_moon, end_of_day(input))
      @astro.count(:solar_term, first, last)
    end
    
    # Day of the month
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of a month for a given date
    # @see Nii::Date#day
    def day(input)
      date  = date(input)
      first = local_date @astro.previous(:new_moon, end_of_day(input))
      date - first + 1
    end

    # The sexagenary cycle for the date.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] number between 1 and 60
    # @see Nii::Date#cycle
    def cycle(input)
      year  = new_year(input).year 
      year += 1 if year < 0 # off by one error due to lack of year 0
      (year - 4) % 60 + 1
    end

    # Whether or not the year the date falls in has an additiional leap month.
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question.
    # @return [true, false] whether the date's year is a leap year.
    # @see Nii::Date#leap_year?
    def leap_year?(input)
      new_year  = new_year(input)
      next_year = new_year(new_year.year + 1)
      @astro.count(:new_moon, new_year, next_year) > 12
    end

    # An additional leap month appears whenever there are 13 instead of 12 new moons
    # between to december solstices.
    #
    # This method determines whether the given date is part of a leap month.
    # A leap month has the same {#month} number as the previous month.
    #
    # @param input [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's month is a leap month
    # @see Nii::Date#leap_month?
    def leap_month?(input)
      date  = date(input)
      first = @astro.previous :new_moon, start_of_day(date)
      last  = @astro.next     :new_moon, end_of_day(date)
      @astro.count(:solar_term, first, last) == 0
    end

    # @private
    def format(input)
      '%d(%d)-M%02d%s-%02d' % [
        year(input), cycle(input), month(input), leap_month?(input) ? 'b' : '', day(input)
      ]
    end

    alias_method :leap_day?, :leap_month?
  end
end
