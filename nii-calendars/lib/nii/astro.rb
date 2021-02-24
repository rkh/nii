# frozen_string_literal: true

module Nii
  # Helper class for astronomical events various calendars are based on.
  #
  # @example Timestamp for the next full moon
  #   astro = Nii::Astro.new
  #   astro.next :full_moon
  #
  # @example Timestamp for the new moon three lunar cycles before the last new moon
  #   astro = Nii::Astro.new
  #   astro.previous :new_moon, offset: 3
  #
  # @example Timestamp for the December solstice in 2021
  #   astro = Nii::Astro.new
  #   astro.solar_event :december_solstice, 2021
  #
  # Using offsets is significantly faster than combining multiple previous/next calls.
  # Negative offsets are possible.
  #
  # This class is considered part of the public API to allow building custom calendar systems
  # on top of it.
  #
  # Supported events:
  # * +march_equinox+ – supported by {#solar_event}, {#next}, {#previous}, and {#count}
  # * +june_solstice+ – supported by {#solar_event}, {#next}, {#previous}, and {#count}
  # * +september_equinox+ – supported by {#solar_event}, {#next}, {#previous}, and {#count}
  # * +december_solstice+ – supported by {#solar_event}, {#next}, {#previous}, and {#count}
  # * +new_moon+ – supported by {#next}, {#previous}, and {#count}
  # * +first_quarter+ – supported by {#next}, {#previous}, and {#count}
  # * +full_moon+ – supported by {#next}, {#previous}, and {#count}
  # * +third_quarter+ – supported by {#next}, {#previous}, and {#count}
  # * +solar_term+ – supported by {#count}
  class Astro
    LUNAR_EVENTS = %i[ new_moon first_quarter full_moon third_quarter ]
    SOLAR_EVENTS = %i[ march_equinox june_solstice september_equinox december_solstice ]
    SOLAR_CYCLE  = ((365 * 24 + 5) * 60 + 49) * 60 + 45
    LUNAR_CYCLE  = ((29 * 24 + 12) * 60 + 44) * 60 + 3
    private_constant :SOLAR_CYCLE, :LUNAR_CYCLE

    # @param data [Nii::Data] data object to use
    # @return [Nii::Astro]
    def self.new(data = Nii::DATA) = data.cache(:astro) { super(data.load_path) }

    # @return [Nii::LoadPath]
    attr_reader :load_path

    # @api internal
    def initialize(load_path)
      @load_path   = load_path
      @data        = {}
      @data_maps   = {}
      @moon_events = [{}, {}, {}, {}]
    end

    # Gives the timestamp for a certain event in a given Gregorian year.
    #
    # @param event_type [Symbol]
    #   Valid events are the elements in {SOLAR_EVENTS}.
    #
    # @param estimate [true, false]
    #   Whether or not to estimate the result if it isn't known.
    #
    # @param year [Integer]
    #   Gregorian year.
    #
    # @raise [TypeError] when result isn't known and +estimate+ is set to +false+.
    # @raise [ArgumentError] when event type isn't known.
    #
    # @return [Time] timestamp of the even in the given year
    def solar_event(event_type, year, estimate: true)
      raise ArgumentError, "unknown event type: #{event_type.inspect}" unless index = SOLAR_EVENTS.index(event_type)
      year = year.to_int

      if time = get(:sun, year, index)
        time(time)
      elsif estimate
        base_year = year.clamp(data(:sun).first.first, data(:sun).last.first)
        time(solar_event(event_type, base_year) + SOLAR_CYCLE * (year - base_year))
      else
        raise TypeError, "dates for #{year} not known"
      end
    end

    # Finds the first event of the given event type after the given time (or the event a certain number
    # of cycles after that one if offset is given).
    #
    # Using offsets is significantly more efficient than calling {#next} repeatedly.
    #
    # @param event_type [Symbol] 
    #   Valid events are the elements in {LUNAR_EVENTS} and {SOLAR_EVENTS}.
    #
    # @param time [to_time]
    #   Time to find the event relative to.
    #
    # @param offset [Integer]
    #   How many event cycles to go forward by.
    #
    # @param match [false, true, Integer]
    #   If set to a truthy value, returns +time+ if it happens to match a given event type.
    #   If set to an Integer, it forgives being off by that amount of seconds.
    #
    # @param estimate [true, false]
    #   Whether or not to estimate the result if it isn't known.
    #
    # @return [Time]
    def next(event_type, time = Time.now, offset: 0, match: true, estimate: true)
      time  = time.to_time.utc
      year  = time.year
      month = time.month
      time  = time.to_i
      
      case match
      when true    then time -= 1
      when Integer then time -= match
      end

      case event_type
      when *SOLAR_EVENTS
        this_year = solar_event(event_type, year, estimate: estimate)
        target    = this_year.to_i > time ? year + offset : year + 1 + offset
        target == year ? this_year : solar_event(event_type, target, estimate: estimate)
      when *LUNAR_EVENTS
        # lets estimate the index - this is way faster than binary search
        # we should be off by at most one
        century      = year / 100
        data         = moon_data(century, event_type)
        index        = (time - data.first).to_i / LUNAR_CYCLE
        index        = 0 if index < 0
        index       += 1 while index < data.size and data[index] <= time
        index       += offset

        while index >= data.size
          index     -= data.size
          century   += 1
          data       = moon_data(century, event_type)
        end

        while index < 0
          century  -= 1
          data      = moon_data(century, event_type)
          index    += data.size
        end

        time data[index]
      else
        raise ArgumentError, "unknown event #{event_type.inspect}"
      end
    end

    # Finds the last event of the given event type before the given time (or the event a certain number
    # of cycles before that one if offset is given).
    #
    # Using offsets is significantly more efficient than calling {#previous} repeatedly.
    #
    # Takes the same arguments as next (offsets go backward in time though).
    #
    # @return [Time]
    # @see #next
    def previous(event_type, time = Time.now, offset: 0, **options)
      self.next(event_type, time, offset: -offset - 1, **options)
    end

    # Counts the number of occurences of an event between two given dates.
    #
    # This method should be significantly faster for longer time ranges
    # than looping through possible offsets, as it first takes a guess based on
    # cycle length (which may be off by ±1) and then corrects it.
    #
    # @param event_type [Symbol] 
    #   Valid events are the elements in {LUNAR_EVENTS} and {SOLAR_EVENTS}, or +:solar_term+.
    #
    # @param range_start [to_time]
    #   Start date or time for the time span.
    #   This point in time is considered part of the range.
    #
    # @param range_end [to_time]
    #   End date or time for the time span.
    #   This point in time is not considered part of the range.
    #
    # @return [Integer]
    #   Number of times the event occures between +range_start+ and +range_end+.
    #   Returns a negative number is range_end is before range_start.
    def count(event_type, range_start, range_end)
      return -count(event_type, range_end, range_start) if range_end < range_start
      return count_solar_terms(range_start, range_end)  if event_type == :solar_term
      first  = self.next(event_type, range_start, match: true)
      last   = previous(event_type, range_end, match: false)
      cycle  = SOLAR_EVENTS.include?(event_type) ? SOLAR_CYCLE : LUNAR_CYCLE
      count  = (first.to_i - last.to_i) / cycle
      count += 1 while self.next(event_type, range_start, offset: count) < last
      count -= 1 while self.next(event_type, range_start, offset: count) > last
      count + 1
    end

    # @private
    def inspect
      "#<#{self.class.inspect}>"
    end

    private

    def count_solar_terms(range_start, range_end)
      range_start  = range_start.to_time.utc
      range_end    = range_end.to_time.utc

      if range_start.year != range_end.year
        count  = count_solar_terms(range_start, Time.utc(range_start.year, 12, 31, 23, 59, 59))
        count += (range_end.year - range_start.year - 1) * 12
        count += count_solar_terms(Time.utc(range_end.year, 1, 1, 0, 0, 0), range_end)
      else
        count       = 0
        last_term   = nil

        [
          solar_event(SOLAR_EVENTS.last, range_start.year - 1),
          *SOLAR_EVENTS.map { |e| solar_event(e, range_start.year) },
          solar_event(SOLAR_EVENTS.first, range_start.year + 1),
        ].each do |term|
          if term >= range_start
            if term <= range_end and last_term.between? range_start, range_end
              count += 3
            else
              distance = (term - last_term).to_i / 3
              count += 1 if (last_term + distance).between? range_start, range_end
              count += 1 if (last_term + 2*distance).between? range_start, range_end
              count += 1 if term <= range_end
            end
          end
          last_term = term
        end

        count
      end
    end

    def time(value)
      Time.at(value).utc
    end

    def get(source, *keys)
      map = @data_maps[source] ||= data(source).map { |k, *v| v.size == 1 ? [k, v[0]] : [k, v] }.to_h
      map.dig(*keys)
    end

    def moon_data(century, event_type)
      key    = '%03d' % century
      index  = LUNAR_EVENTS.index(event_type) || event_type
      result = @moon_events[index][key] ||= data("moon/#{key}")&.select { |t, e| e == index }&.map(&:first)
      raise TypeError, "dates for #{year} not known" unless result
      result
    end

    def data(key)
      @data[key] ||= load_path.read("#{key}.tsv") do |raw|
        raw.each_line.map { |l| l.split("\t").map { |e| Integer(e) }}
      end
    end
  end
end
