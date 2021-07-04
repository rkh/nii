# frozen_string_literal: true

module Nii
  class DayPeriod
    PATTERN = /^(\d\d?)\:(\d\d?)(?:\:(\d\d?))?$/
    private_constant :PATTERN

    # @api internal
    # @param locale [Nii::Locale, String, Symbol, #to_nii_locale]
    # @return [Array<Nii::DayPeriod>] list of day periods for a given locale
    def self.for_locale(locale, data = Nii::DATA, type: :default)
      data.cache(:day_periods, locale, :info, :day_periods, type) do |periods|
        periods&.map { |key, values| new(key, type: type, **values.transform_keys(&:to_sym)) }
      end
    end

    # @api internal
    def self.parse_time(input, offset = 0)
      case input = input.respond_to?(:to_time) ? input.to_time : input
      when PATTERN then [$1.to_i, $2.to_i, $3.to_i + offset]
      when Time    then [input.hour, input.min, input.sec + offset]
      when String  then parse_time(Time.parse(input))
      else input
      end
    rescue ArgumentError => error
      raise error unless error.message =~ /no time information/
      input
    end

    # @return [String] locale independent idetifier for the day period
    attr_reader :name
    alias_method :to_s, :name

    # @return [String] same as name, but with any digits removed from the end ("night" instead of "night1")
    attr_reader :category

    # @return [String, nil] exact time of day the period is valid for (in the format of +HH:MM+)
    # @note If this attribute is nil, then {#from} and {#before} will be set.
    attr_reader :at

    # @return [String, nil] time of day the period is valid from (in the format of +HH:MM+)
    # @note If this attribute is nil, then {#at} will set.
    attr_reader :from

    # @return [String, nil] time of day the period is valid until (excluding, in the format of +HH:MM+)
    # @note If this attribute is nil, then {#at} will set.
    attr_reader :before

    # @return [Symbol] :default or :selection
    attr_reader :type

    # @return [Integer] length of the period in seconds
    attr_reader :length

    # @param name   [String] locale independent idetifier for the day period
    # @param at     [String] exact time of day the period is valid for (in the format of +HH:MM+)
    # @param from   [String] time of day the period is valid from (in the format of +HH:MM+)
    # @param before [String] time of day the period is valid until (excluding, in the format of +HH:MM+)
    # @param type   [Symbol] should be :default or :selection
    #
    # @note
    #   This method is considered part of the public API to allow custom time periods. However, you should
    #   whenever possible prefer {Nii::Info::Time#day_periods context.time.day_periods} or
    #   {Nii::Info::Time#day_period context.time.day_period} over creating your own instances.
    def initialize(name, at: nil, from: nil, before: nil, type: :default)
      @name     = name
      @category = name[/^\D+/]
      @from     = from
      @before   = before
      @at       = at
      @type     = type
      @start    = parse(from)   || parse(at)    || raise(ArgumentError, 'missing from or at option')
      @limit    = parse(before) || parse(at, 1) || raise(ArgumentError, 'missing before or at option')
      @length   = @start.zip(@limit).inject(0) { _1*60+_2[1]-_2[0] }
    end

    # @overload include?(hour, minute, second = 0)
    #   @param hour   [Integer] hour of the day (0 to 23)
    #   @param minute [Integer] minute after the hour of the day (0 to 59)
    #   @param second [Integer] second after the minute of the day (0 to 60, to allow for leap seconds)
    #   @return [true, false] whether the time of day is within the time frame for this period of the day
    #
    # @overload include?(time_of_day)
    #   @param time_of_day [String] time of day in the format of +HH:MM:SS+ or +HH:MM+
    #   @return [true, false] whether the time of day is within the time frame for this period of the day
    #
    # @overload include?(time)
    #   @note
    #     This method does not convert the time to local time. You may have to call
    #     {Nii::Info::Time#local context.time.local(time)} first.
    #   @param time [String, Time, #to_time]
    #   @return [true, false] whether the time is within the time frame for this period of the day
    #
    # @overload include?(object)
    #   @return [false] for objects that cannot be turned into an instance of Time
    def include?(*args)
      case args
      in [ Integer, Integer, Integer ] then (args <=> @start) >= 0 and (args <=> @limit) < 0
      in [ Integer, Integer          ] then include?(*args, 0)
      in [ Array   => input          ] then include?(*input)
      in [ PATTERN => input          ] then include?($1.to_i, $2.to_i, $3.to_i)
      in [ input                     ] then parsed = parse(input) and parsed != input and include?(*parsed)
      else raise ArgumentError, "wrong number of arguments (given #{args.size}, expected 1)"
      end
    end

    alias_method :===, :include?

    # @return [true, false] whether or not ths day period represents morning
    # @note
    #   Day periods can overlap. This method will *not* check if "morning" overlaps with this day period,
    #   but instead of this day period represents "morning". To check overlap, instead use
    #   {Nii::Info::Time#morning? context.time.morning?}.
    def morning? = category == 'morning'

    # @return [true, false] whether or not ths day period represents noon
    # @note
    #   Day periods can overlap. This method will *not* check if "noon" overlaps with this day period,
    #   but instead of this day period represents "noon". To check overlap, instead use
    #   {Nii::Info::Time#noon? context.time.noon?}.
    def noon? = category == 'noon'

    # @return [true, false] whether or not ths day period represents afternoon
    # @note
    #   Day periods can overlap. This method will *not* check if "afternoon" overlaps with this day period,
    #   but instead of this day period represents "afternoon". To check overlap, instead use
    #   {Nii::Info::Time#afternoon? context.time.afternoon?}.
    def afternoon? = category == 'afternoon'

    # @return [true, false] whether or not ths day period represents evening
    # @note
    #   Day periods can overlap. This method will *not* check if "evening" overlaps with this day period,
    #   but instead of this day period represents "evening". To check overlap, instead use
    #   {Nii::Info::Time#evening? context.time.evening?}.
    def evening? = category == 'evening'

    # @return [true, false] whether or not ths day period represents night
    # @note
    #   Day periods can overlap. This method will *not* check if "night" overlaps with this day period,
    #   but instead of this day period represents "night". To check overlap, instead use
    #   {Nii::Info::Time#night? context.time.night?}.
    def night? = category == 'night'

    # @return [true, false] whether or not ths day period represents am
    # @note
    #   Day periods can overlap. This method will *not* check if "am" overlaps with this day period,
    #   but instead of this day period represents "am". To check overlap, instead use
    #   {Nii::Info::Time#am? context.time.am?}.
    def am? = category == 'am'

    # @return [true, false] whether or not ths day period represents pm
    # @note
    #   Day periods can overlap. This method will *not* check if "pm" overlaps with this day period,
    #   but instead of this day period represents "pm". To check overlap, instead use
    #   {Nii::Info::Time#pm? context.time.pm?}.
    def pm? = category == 'pm'

    # Allows pattern matching without a keyword against the name.
    def deconstruct = [name]
    
    # Allows pattern matching on name, before, from, at, and type.
    # @return [Hash]
    def deconstruct_keys(...) = @deconstruct_keys ||= { name: name, before: before, from: from, at: at, type: type }

    # @return [true, false] whether or not the other is a day period with the same name
    def ==(other) = other.is_a?(DayPeriod) && other.name == name

    # @return [true, false] whether the other is a day period with the same name, start/end time, and type
    def eql?(other) = other.is_a?(DayPeriod) && other.deconstruct_keys == deconstruct_keys

    # @api internal
    def hash = @hash ||= name.hash + @start.hash + @limit.hash

    # @private
    def inspect = "#<#{self.class.name}:#{name.inspect} (#{at ? at : "#{from}-#{before}"})>"

    private
    def parse(...) = self.class.parse_time(...)
  end
end
