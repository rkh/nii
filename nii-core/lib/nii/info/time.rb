# frozen_string_literal: true

module Nii::Info
  class Time < Generic
    DEFAULT_DATE_FORMATS = { iso: Nii::TimePattern.new('y-MM-dd') }
    private_constant :DEFAULT_DATE_FORMATS

    # @overload day_periods(type: :default)
    #   @return [Array<Nii::DayPeriod>] list of all day periods known in the current locale
    #
    #   @note
    #     Day periods may overlap, especially as most locales know both am/pm, and a more
    #     fine-grained list of periods (morning, afternoon, evening, and/or night).
    #
    # @overload day_periods(time, type: default)
    #   @param time [Time, String, #to_time] A time or relative day time (+HH:MM+ or +HH:MM:SS+)
    #   @return [Array<Nii::DayPeriod>] list of all day periods matching the given time
    #   @see #day_period
    def day_periods(time = nil, type: :default)
      time  &&= Array(Nii::DayPeriod.parse_time(time)) # only parse once
      periods = Nii::DayPeriod.for_locale(context.data_locale, data, type: type)
      time ? periods.select { _1.include?(*time) } : periods
    end

    # Determines the most suitable day period for a given time (or current time if none is given).
    # If multiple match, this will return the shortest of them, usually resulting in the best option.
    #
    # @param time [Time, String, #to_time] A time or relative day time (+HH:MM+ or +HH:MM:SS+)
    # @return [Nii:DayPeriod] day period matching the or given time
    # @see #day_periods
    def day_period(time = now, type: :default) = day_periods(time, type: type).min_by(&:length)

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered morning in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#morning?}, this method will check all day periods matching the given time.
    def morning?(time = now) = day_periods(time).any? { _1.morning? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered noon in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#noon?}, this method will check all day periods matching the given time.
    def noon?(time = now) = day_periods(time).any? { _1.noon? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered afternoon in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#afternoon?}, this method will check all day periods matching the given time.
    def afternoon?(time = now) = day_periods(time).any? { _1.afternoon? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered evening in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#evening?}, this method will check all day periods matching the given time.
    def evening?(time = now) = day_periods(time).any? { _1.evening? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered night in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#night?}, this method will check all day periods matching the given time.
    def night?(time = now) = day_periods(time).any? { _1.night? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered am in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#am?}, this method will check all day periods matching the given time.
    def am?(time = now) = day_periods(time).any? { _1.am? }

    # @param time [Time, String, #to_time]
    #   A time or relative day time (+HH:MM+ or +HH:MM:SS+) to check
    #
    # @return [true, false]
    #   whether +time+ falls within what is considered pm in the current locale
    #
    # @note
    #   In contrast to {Nii::DayPeriod#pm?}, this method will check all day periods matching the given time.
    def pm?(time = now) = day_periods(time).any? { _1.pm? }

    # @example
    #   context = Nii::Context.new 'de-CH', timezone: 'CET'
    #
    #   # create a new time in the context's timezone
    #   time = context.time 2012, 12, 20 # => 2012-12-20 00:00:00 +0100
    #   time.zone # => #<Nii::Timezone:"Zurich, Switzerland">
    #
    #   # convert a time to the context's timezone (same as context.time.now)
    #   context.time Time.now
    #
    # @param args [Time, Array<Integer>]
    # @return [Time]
    # @see Nii::Timezone#local
    def local(*args) = context.timezone.local(*args)
    alias_method :[], :local

    # @return [Time] the current time in {Nii::Context#timezone}
    def now = context.timezone.local

    # @overload zone
    #   Same as {Nii::Context#timezone}.
    #   @return [Nii::Timezone]
    #   @see Nii::Context#timezone
    #
    # @overload zone(name)
    #   Resolves a timezone identifier for the current context.
    #
    #   @example
    #     context = Nii::Context.new "en-US"
    #     context.time.zone "ET" # => #<Nii::Timezone:"New York, United States">
    #
    #     context = Nii::Context.new "en-CA"
    #     context.time.zone "ET" # => #<Nii::Timezone:"Toronto, Canada">
    #
    #   @param name [String, Symbol, TZInfo::Timezone, ActiveSupport::Timezone, Nii::Timezone]
    #     The timezone identifier. See {Nii::Timezone.new} for a list of possible values.
    #
    #   @return [Nii::Timezone]
    def zone(name = nil) = name ? Nii::Timezone.new(name, territory, config) : context.timezone

    # @return [Nii::Timezone::Meta]
    # @see Nii::Timezone#meta_zone
    def meta_zone(name = nil) = zone(name).meta_zone

    # @param calendar [nil, String, Symbol, Nii::Calendar]
    # @return [Hash{Symbol => Nii::TimePattern}]
    def date_formats(calendar = nil)
      calendar ||= context.calendar
      data.cache(:date_formats, data_locale, :calendars, calendar, :date_formats) do
        result = DEFAULT_DATE_FORMATS.merge(pattern_map(_1.to_h))
        result.merge! pattern_match(config.date_formats[calendar.to_sym]) if config.date_formats and config.date_formats[calendar.to_sym]
        result
      end
    end

    # @param style [Symbol, #to_sym] Style to use (full, long, medium, short).
    # @param calendar [nil, String, Symbol, Nii::Calendar]
    def date_format(style, calendar: nil, complain: true)
      style = style.to_sym
      date_formats(calendar).fetch(style) do
        date_formats(:generic).fetch(style) do
          return unless complain
          raise ArgumentError, "Unknown date format style #{style.inspect}"
        end
      end
    end

    private

    def pattern_map(input)
      input.transform_keys(&:to_sym).transform_values do |value|
        case value
        when String then Nii::TimePattern.new(value)
        when Hash   then pattern_map(value)
        else value
        end
      end
    end
  end
end
