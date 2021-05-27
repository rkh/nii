# frozen_string_literal: true

module Nii::Calendar
  # @abstract Superclass for all calendar implementations.
  #
  # Calendar objects are used to compute and convert {Nii::Date} values.
  # Each instance represents a calendar system. There may be one class representing a single system, or a class representing multiple systems in one.
  class Generic
    # mapping for Ruby's cweek to week_day
    WEEK_DAYS = %i[sun mon tue wed thu fri sat]
    private_constant :WEEK_DAYS

    # @api internal
    def self.default_type = Nii::Utils.type(self).name

    # @api internal
    def self.supports_type?(type) = self != Generic && type == default_type

    # @api internal
    def self._load(type) = new(type)

    # @api internal
    def _dump(level) = type

    # @api internal
    attr_reader :data

    # @return [String] CLDR compatible calendar identifier
    attr_reader :type

    # @api internal
    def initialize(data: Nii::DATA, type: nil)
      # @eras = eras
      @type = Nii::Utils.string(type || self.class.default_type)
      @data = data
      setup
    end

    # @return [Nii::Date] todays day converted to self as calendar system
    def today = Nii::Date.new(self, ::Date.today)

    # Converts a date from a source calendar (usually Georgian, but might be Julian for Ruby's Date objects, and any supported
    # calendar for Nii's {Nii::Date} objects) to self.
    #
    # @overload convert(date)
    #   Converts a date object to a {Nii::Date} converted to self as its calendar.
    #   @param date [::Date, Nii::Date, #to_nii_date, #to_date] date to convert to the calendar
    #
    # @overload convert(year, month, day)
    #   Converts a year, month, and day number to a {Nii::Date} converted to self as its calendar.
    #   Similar to +Date.new+, but treats all dates as Georgian dates.
    #   @param year [Integer] Gregorian year
    #   @param month [Integer] Gregorian month
    #   @param day [Integer] Gregorian day
    #
    # @overload convert(**options)
    #   Converts +year+, +month+, and +day+ options to a {Nii::Date} converted to self as its calendar.
    #   @option options [Integer] year Gregorian year
    #   @option options [Integer] month Gregorian month
    #   @option options [Integer] day Gregorian day
    #
    # @overload convert(string, format = "%F")
    #   Converts a date string to a {Nii::Date} converted to self as its calendar.
    #   Similar to Ruby's +Date.strptime+, but treats all dates as Georgian dates.
    #   @param string [String] a date string (should be in the format of "YYYY-MM-DD" unless format parameter is overridden).
    #   @param format [String] Ruby date format string to describe the format of the date parameter.
    #
    # @return [Nii::Date] the date converted to self
    # @raise [TypeError] when it can't convert the given argument type
    # @see Nii::Date#convert_to
    #
    # @note
    #   Nii only guarantees correct calendar conversion between all calendars from the year 1927 to the year 2800, but aims for significantly higher precision for most date conversions:
    #   * Solar and lunisolar calendar system conversion should be correct on a day granularity until at least the 12th millenia CE. After this they may start diverging by a day per decamillennium.
    #   * Lunar calendar conversion should be correct on a day granularity until at least the 33rd millenia CE. After this they may start diverging by a day every three decamillennia.
    #   * Dates before the year 4712 BCE may be converted incorrectly (some calendar systems may even raise an exceptions for earler dates).
    #   * Some calendars may have a set start date which might be the earliest date they can correctly convert from/to.
    #   * These errors may compound for dates very far in the past or future.
    def convert(*arguments)
      case arguments
      in [::Date | Nii::Date]              then Nii::Date.new(self, *arguments)
      in [Integer, Integer, Integer]       then convert(::Date.new(*arguments, ::Date::GREGORIAN))
      in [{year:, month:, day:}]           then convert(::Date.new(year, month, day, ::Date::GREGORIAN))
      in [String, String]                  then convert(Date.strptime(*arguments, ::Date::GREGORIAN))
      in [String]                          then convert(*arguments, '%F', ::Date::GREGORIAN)
      in [d] if d.respond_to? :to_nii_date then convert d.to_nii_date
      in [d] if d.respond_to? :to_date     then convert d.to_date
      in []                                then raise ArgumentError, 'wrong number of arguments (given 0, expected 1+))'
      else raise TypeError, "cannot convert #{arguments.first.class.inspect}"
      end
    end

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for a given date
    # @see Nii::Date#year
    def year(date) = raise(NotImplementedError, 'subclass responsibility')

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's quarter for a given date
    # @see Nii::Date#quarter
    def quarter(date) = raise(NotImplementedError, 'subclass responsibility')

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's month for a given date
    # @see Nii::Date#month
    def month(date) = raise(NotImplementedError, 'subclass responsibility')

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of a month for a given date
    # @see Nii::Date#day
    def day(date) = raise(NotImplementedError, 'subclass responsibility')

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's day of a month for a given date
    # @see Nii::Date#day
    # @see Nii::Calendar::Generic#day
    def day_of_year(date) = jd(date) - jd(new_year(date)) + 1

    # @abstract The exact behavior of this method depends on the calendar system.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Symbol] the week day for a given date, as a three letter symbol
    # @see Nii::Date#week_day
    def week_day(date) = WEEK_DAYS[date(date).wday]

    # @abstract The exact behavior of this method depends on the calendar system.
    # The year cycle for a given date. Non-cyclic calendars will return +nil+.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer, nil]
    # @see Nii::Date#cycle
    def cycle(date) = nil

    # @abstract The exact behavior of this method depends on the calendar system.
    # The epoch for a given date. Will return +nil+ if outside of known epochs or the calendar system doesn't support epochs.
    # May be off for furture dates in calendar system that have non-deterministic epochs (most notably the Japanese calendar).
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer, nil]
    # @see Nii::Date#era
    def era(date)
      raise 'todo'
    end

    # @abstract The exact behavior of this method depends on the calendar system.
    # Calculates the Gregorian date of the new year.
    #
    # @overload new_year(year)
    #   @param year [Integer] Gregorian year
    #   @return [::Date] Gregorian date of the new year within the Gregorian year
    #
    # @overload new_year(date)
    #   @param date [Time, Date, ::Nii::Date, #to_date, #to_nii_date] A date or time
    #   @return [::Date] Gregorian date of the first day of the year the date is part of
    def new_year(date) = raise(NotImplementedError, 'subclass responsibility')

    # @abstract The exact behavior of this method depends on the calendar system.
    # Nii considers a year a leap year if it has a different number of days from normal years.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question.
    # @return [true, false] whether the date's year is a leap year.
    # @see Nii::Date#leap_year?
    def leap_year?(date) = false

    # @abstract The exact behavior of this method depends on the calendar system.
    # Nii considers a month a leap month if it doesn't occur in a normal year.
    # This will always return +false+ for Gregorian or Julian calendars.
    #
    # A leap month may have the same {#month} number as another month that year,
    # a separate one, or none at all.
    #
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's month is a leap month
    # @see Nii::Date#leap_month?
    def leap_month?(date) = false

    # @abstract The exact behavior of this method depends on the calendar system.
    # Nii considers a day a leap day if it doesn't occur in a normal year.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [true, false] whether the date's month is a leap month
    # @see Nii::Date#leap_day?
    def leap_day?(date) = false

    # ISO week year for a given date.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's year for the week of a given date
    # @see Nii::Date#year_of_week
    def year_of_week(date) = date(date).cwyear

    # ISO week number for a given date.
    # @param date [::Date, Nii::Date, #to_nii_date, #to_date] date in question
    # @return [Integer] the calendar's week number for a given date
    # @see Nii::Date#week
    def week(date) = date(date).cweek

    # @api internal
    def format(date) = '%d-%02d-%02d' % [ year(date), month(date), day(date) ]
    
    def deconstruct = [type]

    # @return [self]
    def to_nii_calendar
      self
    end

    # @api internal
    def calculate_jd(**options) = raise(ArgumentError, "cannot calculate gregorian from #{type} for given options")

    # @!group Ruby Object protocol
    def hash        = self.class.hash + data.hash
    def eql?(other) = self.class.eql?(other.class) && data.eql?(other.data)
    def ==(other)   = self.class == other.class && data == other.data
    # @!endgroup

    private

    def julio_gregorian_leap_year?(date)
      year = Integer === date ? date : year(date)
      return true if year == reform_year
      year > reform_year ? ::Date.gregorian_leap?(year) : ::Date.julian_leap?(year)
    end

    def reform_year
      @reform_year ||= reform_jd.infinite? ? reform_jd : ::Date.jd(reform_jd, reform_jd).year
    end

    def setup
    end

    # date of the calendar reform from Julian to Gregorian
    def reform_jd = @reform_jd ||= ::Date::GREGORIAN

    def jd(date)
      return date    if date.is_a? Integer
      return date.jd if date.respond_to? :jd
      date(date).jd
    end

    def date(date, start = reform_jd)
      # Nii::Date will cache to_date(::Date::GREGORIAN) (but not other starts)
      case date
      when Nii::Date then date.to_date(start)
      when ::Date    then date.new_start(start)
      else date.to_date.new_start(start)
      end
    end
  end
end
