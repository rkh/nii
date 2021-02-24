
module Nii::Calendars
  # @api internal
  module LocationHelpers
    private

    def start_of_day(input) = local_time(input, 0, 0, 0)
    def end_of_day(input)   = local_time(input, 23, 59, 59)
    attr_reader :astro, :utc_offset

    def setup
      @astro = Nii::Astro.new(@data)
      @utc_offset = self.class::UTC_OFFSET
      super
    end

    def local_time(input, hour, minute, second)
      date = local_date(input)
      Time.new(date.year, date.month, date.day, hour, minute, second, utc_offset)
    end

    def local_date(input)
      return date(input) unless input.is_a? Time
      time = input.localtime utc_offset
      ::Date.new(time.year, time.month, time.day, ::Date::GREGORIAN)
    end
  end
end
