# frozen_string_literal: true

module Nii
  # A date class for various calendar systems.
  class Date
    include Comparable

    # @return [Nii::Calendar::Generic] the date's underlying calendar system
    attr_reader :calendar

    # @api internal
    attr_reader :jd

    # @param calendar [String, Symbol, Nii::Calendar::Generic] calendar to use (example values: +gregorian+, +chinese+)
    # @return [Nii::Date] Today's date in the given calendar system
    def self.today(calendar) = new(calendar, ::Date.today)

    # @api internal
    def self._load(data)
      calendar, jd = data.split(':')
      new(calendar, Integer(jd))
    end

    # @api internal
    def _dump(level) = "#{calendar.type}:#{jd}"

    # @overload initialize(calendar, date)
    #   @param calendar [String, Symbol, Nii::Calendar::Generic] calendar to use (example values: +gregorian+, +chinese+)
    #   @param date [::Date, Nii::Date, #to_date, #to_nii_date] base date
    # @overload initialize(calendar, year:, month:, day:, cycle: nil, era: nil)
    #   @param calendar [String, Symbol, Nii::Calendar::Generic] calendar to use (example values: +gregorian+, +chinese+)
    def initialize(calendar, date = nil, **options)
      @calendar     = calendar.to_nii_calendar if calendar.respond_to? :to_nii_calendar
      @calendar   ||= Nii::DATA.calendar(calendar)
      @era          = options[:era]
      @year         = options[:year]
      @quarter      = options[:quarter]
      @month        = options[:month]
      @week         = options[:week]
      @day          = options[:day]
      @day_of_year  = options[:day_of_year]
      @week_day     = options[:week_day]
      @cycle        = options[:cycle]
      @year_of_week = options[:year_of_week]
      @leap_year    = options[:leap_year]
      @leap_month   = options[:leap_month]
      @leap_day     = options[:leap_day]

      case date
      when Integer
        @jd = date
      when nil
        @jd = @calendar.calculate_jd(options)
      when Date
        @jd = date.jd
        if date.calendar == @calendar
          @era          ||= date.era
          @year         ||= date.year
          @quarter      ||= date.quarter
          @month        ||= date.month
          @week         ||= date.week
          @day          ||= date.day
          @day_of_year  ||= date.day_of_year
          @week_day     ||= date.week_day
          @cycle        ||= date.cycle
          @year_of_week ||= date.year_of_week
          @leap_year      = options[:leap_year]  if @leap_year.nil?
          @leap_month     = options[:leap_month] if @leap_month.nil?
          @leap_day       = options[:leap_day]   if @leap_day.nil?
        end
      else
        @jd = date.to_date.jd
      end
    end
    
    # @!attribute [r] era
    # @return [Integer] the date's era
    # @see Nii::Calendar::Generic#era
    def era = @era ||= @calendar.era(self)
    
    # @!attribute [r] year
    # @return [Integer] the date's year
    # @see Nii::Calendar::Generic#year
    def year = @year ||= @calendar.year(self)
    
    # @!attribute [r] quarter
    # @return [Integer] the date's quarter
    # @see Nii::Calendar::Generic#quarter
    def quarter = @quarter ||= @calendar.quarter(self)
    
    # @!attribute [r] month
    # @return [Integer] the date's month
    # @see Nii::Calendar::Generic#month
    def month = @month ||= @calendar.month(self)
    
    # @!attribute [r] week
    # @return [Integer] the date's week
    # @see Nii::Calendar::Generic#week
    def week = @week ||= @calendar.week(self)
    
    # @!attribute [r] day
    # @return [Integer] the date's day
    # @see Nii::Calendar::Generic#day
    def day = @day ||= @calendar.day(self)

    # @!attribute [r] day_of_year
    # @return [Symbol] day of the year (starting at 1)
    # @see Nii::Calendar::Generic#day_of_year
    def day_of_year = @day_of_year ||= @calendar.day_of_year(self)

    # @!attribute [r] week_day
    # @return [Symbol] the date's week day, as a three letter symbol
    # @see Nii::Calendar::Generic#week_day
    def week_day = @week_day ||= @calendar.week_day(self)
    
    # @!attribute [r] cycle
    # @return [Integer] the date's year cycle
    # @see Nii::Calendar::Generic#cycle
    def cycle = @cycle ||= @calendar.cycle(self)
    
    # @!attribute [r] year_of_week
    # @return [Integer] the date's week's year
    # @see Nii::Calendar::Generic#year_of_week
    def year_of_week = @year_of_week ||= @calendar.year_of_week(self)

    # Nii considers a year a leap year if it has a different number of days from normal years.
    # @return [true, false] whether the date's year is a leap year
    def leap_year?
      @leap_year = @calendar.leap_year?(self) if @leap_year.nil?
      !!@leap_year
    end

    # Nii considers a month a leap month if it doesn't occur in a normal year.
    # This will always return +false+ for Gregorian or Julian calendars.
    #
    # A leap month may have the same {#month} number as another month that year,
    # a separate one, or none at all.
    #
    # @return [true, false] whether the date's month is a leap month
    def leap_month?
      @leap_month = @calendar.leap_month?(self) if @leap_month.nil?
      !!@leap_month
    end

    # Nii considers a day a leap day if it doesn't occur in a normal year.
    # February 29th is a leap day in Gregorian years.
    #
    # @return [true, false] whether the date's month is a leap month
    def leap_day?
      @leap_day = @calendar.leap_day?(self) if @leap_day.nil?
      !!@leap_day
    end

    # Allows pattern matching against Nii::Dates.
    # The following fields can be mached against: era, year, quarter, month, week, day
    # day_of_year, week_day, cycle, year_of_week, calendar, jd, leap_year, leap_month,
    # leap_day.
    #
    # @example
    #   if date in Nii::Date(calendar: chinese, leap_year: true)
    #     puts "Chinese leap year!"
    #   end
    #
    # @param [nil, Array<Symbol>]
    # @return [Hash]
    def deconstruct_keys(keys)
      @deconstructed ||= to_h.merge({
        calendar:   @calendar.type,
        jd:         @jd,
        leap_year:  leap_year?,
        leap_month: leap_month?,
        leap_day:   leap_day?,
      }).freeze
    end

    # @api internal
    def freeze
      deconstruct_keys(nil)
      super
    end

    # Turns a date into a Hash.
    # @return [Hash]
    def to_h
      @to_h ||= {
        # era:          era, # todo
        year:         year,
        quarter:      quarter,
        month:        month,
        cweek:        week,
        day:          day,
        day_of_year:  day_of_year,
        week_day:     week_day,
        cycle:        cycle,
        year_of_week: year_of_week,
      }.freeze
    end

    # @return [self]
    def to_nii_date
      self
    end

    # @param start [Integer, nil] Julian day number which denotes the day of calendar reform
    # @return [::Date] the date converted to Ruby's Date class (and thus Gregorian or Julian).
    def to_date(start = ::Date::ITALY)
      date = @date ||= ::Date.jd(jd, ::Date::GREGORIAN)
      date = date.new_start(start) if start != ::Date::GREGORIAN
      date
    end

    # @param start [Integer, nil] Julian day number which denotes the day of calendar reform
    # @return [::DateTime] the date converted to Ruby's DateTime class (and thus Gregorian or Julian).
    def to_date_time(start = ::Date::ITALY)
      to_date(start).to_date_time
    end

    # @return [::Time] the date converted to Ruby's Time class (and thus Gregorian).
    def to_time
      to_date.to_time
    end

    # Converts the date to another calendar system.
    # @param calendar [String, Symbol, Nii::Calendar::Generic] calendar system to convert to (example values: +gregorian+, +chinese+)
    # @return [Nii::Date]
    # @see Nii::Calendar::Generic#convert
    def convert_to(calendar)
      Date.new(calendar, self)
    end

    # @overload <=>(other)
    #   @return [-1, 0, 1, nil] implements Ruby's Comparable protocol.
    #   @param other [::Date, Nii::Date, #to_date, #to_nii_date] date to compare with
    #
    # @overload <(other)
    #   @return [true, false] whether other is before self
    #   @param other [::Date, Nii::Date, #to_date, #to_nii_date] date to compare with
    #
    # @overload <=(other)
    #   @return [true, false] whether other is before or on self
    #   @param other [::Date, Nii::Date, #to_date, #to_nii_date] date to compare with
    #
    # @overload >(other)
    #   @return [true, false] whether other is after self
    #   @param other [::Date, Nii::Date, #to_date, #to_nii_date] date to compare with
    #
    # @overload >=(other)
    #   @return [true, false] whether other is on or after self
    #   @param other [::Date, Nii::Date, #to_date, #to_nii_date] date to compare with
    #
    # @overload between?(min, max)
    #   @return [true, false] whether other date is between min and max
    #   @param min [::Date, Nii::Date, #to_date, #to_nii_date] first date to compare with
    #   @param max [::Date, Nii::Date, #to_date, #to_nii_date] first date to compare with
    #
    # @overload clamp(min, max)
    #   @return [self, min, max] self if it is between min and max, min or max otherwise (whichever is closer to self).
    #   @param min [::Date, Nii::Date, #to_date, #to_nii_date] first date to compare with
    #   @param max [::Date, Nii::Date, #to_date, #to_nii_date] first date to compare with
    def <=>(other)
      return jd <=> other.to_nii_date.jd if other.respond_to? :to_nii_date
      jd <=> other.to_date.jd if other.respond_to? :to_date
    end

    # @return [String] a generic string representation for the date
    # @see Nii::Context#format
    def to_s
      calendar.format(self)
    end

    # Adds a given number of days to the date.
    # @param other [Numeric] offset in days
    # @return [Nii::Date] the new date
    # @raise [TypeError]
    def +(other)
      raise TypeError, 'expected numeric' unless other.is_a? Numeric
      other == 0 ? self : Date.new(calendar, jd + other)
    end
    
    # @overload -(number)
    #   Removes a given number of days from the date.
    #   @param other [Numeric] offset in days
    #   @return [Nii::Date] the new date
    #
    # @overload -(date)
    #   Calculates the offset in days between two dates.
    #   @param date [::Date, Nii::Date, #to_date, #to_nii_date] date to substract from self
    #   @return [Integer] difference in days between the dates
    #
    # @return [Nii::Date, Integer]
    # @raise [TypeError]
    def -(other)
      return jd - other.to_nii_date.jd if other.respond_to? :to_nii_date
      return jd - other.to_date.jd     if other.respond_to? :to_date
      self + -other
    end

    # @private
    def inspect
      string   = to_s.inspect
      standard = to_date(::Date::GREGORIAN).to_s.inspect
      info     = [calendar.type]
      info << "gregorian=#{standard}" if standard != string
      "#<#{self.class}:#{string} (#{info.join(', ')})>"
    end
  end
end
