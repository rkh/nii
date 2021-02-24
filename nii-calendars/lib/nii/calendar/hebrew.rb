# frozen_string_literal: true

module Nii::Calendar
  # The Hebrew calendar system.
  # This implementation assumes the start of the day to be at 6:00 pm, as is standard practice for modern Hebrew calendar computation.
  # Years begin with Rosh Hashanah (as does the Hebrew civil year). It therefore has a seven month offset to the ecclesiastical calendar.
  class Hebrew < Generic
    LEAP_YEARS = [3, 6, 8, 11, 14, 17, 19]

    def year(input)
      todo
    end

    def leap_year?(input) = LEAP_YEARS.include?(cycle(input))
    
    def cycle(input)
      year = Integer === input ? input : year(input)
      mod  = year % 19
      mod == 0 ? 19 : mod
    end

    private

    def date(input, start = reform_jd)
      return super unless input.respond_to? :hout
      input.hour >= 18 ? super + 1 : super
    end
  end
end
