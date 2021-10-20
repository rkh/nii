# frozen_string_literal: true

module Nii::Formatters::Nii
  # @api internal
  class Date
    ENDLESS = /^(?:gg+|rr+|uu+|yy+|YY+)$/
    private_constant :ENDLESS

    # @see Nii::Context#format
    def self.format(context, value, **options)
      formatter = new(context, value, **options)
      if format = options[:date_format] || options[:format]
        pattern = context.time.date_format(format, calendar: value.calendar, complain: false) || format
      else
        style   = options[:date_style]   || options[:style]   || context.config.date_style || :medium
        pattern = options[:date_pattern] || options[:pattern] || context.time.date_format(style, calendar: value.calendar)
      end
      pattern   = ::Nii::TimePattern.new(pattern) if pattern.is_a?(::String)
      pattern.format(formatter)
    end

    def initialize(context, value, **options)
      @context     = context
      @value       = value
      @era_variant = options[:era_variant] || context.config.era_variant || 'default'
      @era_variant = 'variant' if @era_variant == true
      @era_variant = @era_variant.to_s
    end

    def era_variant(value)
      return value unless value.is_a? Hash
      value[@era_variant] || value['default']
    end

    # See https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Format_Patterns

    def G     = era_variant(data(:eras, :era_abbr, @value.era))
    def GG    = self.G
    def GGG   = self.G
    def GGGG  = era_variant(data(:eras, :era_name, @value.era))
    def GGGGG = era_variant(data(:eras, :era_narrow, @value.era))
    def y     = @value.year
    def yy    = fill(y, 2)
    def yyy   = fill(y, 3)
    def yyyy  = fill(y, 4)
    def Y     = @value.year_of_week
    def YY    = fill(self.Y, 2)
    def YYY   = fill(self.Y, 3)
    def YYYY  = fill(self.Y, 4)
    def u     = raise(NotImplementedError)
    def U     = raise(NotImplementedError)
    def UU    = self.U
    def UUU   = self.U
    def UUUU  = self.U # for now
    def UUUUU = self.U # for now
    def r     = @value.gregorian_year
    def rr    = fill(r, 2)
    def rrr   = fill(r, 3)
    def rrrr  = fill(r, 4)
    def q     = @value.quarter
    def qq    = fill(q, 2)
    def qqq   = data(:quarters, 'stand-alone', :abbreviated, q)
    def qqqq  = data(:quarters, 'stand-alone', :wide, q)
    def qqqqq = data(:quarters, 'stand-alone', :narrow, q)
    def Q     = q
    def QQ    = qq
    def QQQ   = data(:quarters, :format, :abbreviated, q)
    def QQQQ  = data(:quarters, :format, :wide, q)
    def QQQQQ = data(:quarters, :format, :narrow, q)
    def M     = @value.month
    def MM    = fill(self.M, 2)
    def MMM   = data(:months, :format, :abbreviated, self.M)
    def MMMM  = data(:months, :format, :wide, self.M)
    def MMMMM = data(:months, :format, :narrow, self.M)
    def L     = self.M
    def LL    = fill(self.M, 2)
    def LLL   = data(:months, 'stand-alone', :abbreviated, self.M)
    def LLLL  = data(:months, 'stand-alone', :wide, self.M)
    def LLLLL = data(:months, 'stand-alone', :narrow, self.M)
    def I     = ''
    def w     = @value.week
    def ww    = fill(w, 2)
    def W     = raise(NotImplementedError)
    def d     = @value.day
    def dd    = fill(d, 2)
    def D     = @value.day_of_year
    def DD    = fill(self.D, 2)
    def DDD   = fill(self.D, 3)
    def F     = raise(NotImplementedError)
    def g     = @value.jd
    def E     = data(:days, :format, :abbreviated, @value.week_day)
    def EE    = self.E
    def EEE   = self.E
    def EEEE  = data(:days, :format, :wide, @value.week_day)
    def EEEEE = data(:days, :format, :narrow, @value.week_day)
    def e     = @value.day_of_week # todo: should be localized
    def ee    = fill(e, 2)
    def eee   = self.EEE
    def eeee  = self.EEEE
    def eeeee = self.EEEEE
    def c     = e
    def cc    = e
    def ccc   = data(:days, 'stand-alone', :abbreviated, @value.week_day)
    def cccc  = data(:days, 'stand-alone', :wide, @value.week_day)
    def ccccc = data(:days, 'stand-alone', :narrow, @value.week_day)

    def respond_to_missing?(method, include_private = false) = super || method =~ ENDLESS

    private

    def data(*keys) = @context.locale_data(:calendars, @value.calendar, *keys) || @context.locale_data(:calendars, :generic, *keys)
    def fill(value, length, fill_char = '0') = value.to_s.rjust(length, fill_char)[-length..-1]

    def method_missing(method, *args, &block)
      return super unless method =~ ENDLESS
      raise ArgumentError, "wrong number of arguments (#{args.size} for 0)" if args.size > 0
      fill(public_send(method[0]), method.length)
    end
  end
end
