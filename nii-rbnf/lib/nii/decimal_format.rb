# frozen_string_literal: true

module Nii
  # Implements ICU's Decimal Formatter.
  # This is used internally by RBNF.
  #
  # @example
  #   Nii::DecimalFormat.new('#,##,##0.00').format(123456) # => "1,23,456.00"
  class DecimalFormat
    CACHE   = {}
    PATTERN = %r{\A
      (?<prefix>
        [^@\.\,\#\%\*0-9E‰¤%]*
        (?<special_prefix>[‰¤%])?
        [^@\.\,\#\%\*0-9E‰¤%]*
      )
      (?:
        (?:
          (?<ternary>[\#\,]*\,)?
          (?<secondary>\#+)
          \,
        )?
        (?<primary>\#*0*0)
        (?:\.(?<fraction>0*\#*))?
      |
        \#*
        (?<sig_digits>@+\#*)
      )
      (?<suffix>
        [^@\.\,\#\%\*0-9E‰¤%]*
        (?<special_suffix>[‰¤%])?
        [^@\.\,\#\%\*0-9E‰¤%]*
      )
      (?:
        ;
        (?<negative_prefix>[^\.\,\#\%\*0-9E]*)
        [\.\,\#\%\*0-9E]+
        (?<negative_suffix>[^\.\,\#\%\*0-9E]*)
      )?
    \Z}x
    private_constant :PATTERN, :CACHE

    # Same as .new, but with permanent caching. Don't use this with user supplied patterns.
    def self.[](pattern) = CACHE[pattern] ||= new(pattern)

    # @param pattern [String] Decimal Format pattern
    # @return [Nii::DecimalFormat]
    def self.new(pattern) = CACHE[pattern] || super

    # @return [String] Decimal Format pattern
    attr_reader :pattern
  
    # @return [String] separator between the units
    attr_reader :separator
    
    # @return [String] thousands delimiter
    attr_reader :delimiter
    
    # @return [String, Array<String>, nil] digits to use instead of normal digitis
    attr_reader :digits

    # @api internal
    def initialize(pattern)
      raise ArgumentError, "unsupported format: #{pattern.inspect}" unless match = PATTERN.match(pattern)   
      @pattern         = pattern
      @prefix          = match[:prefix]
      @suffix          = match[:suffix]
      @negative_prefix = match[:negative_prefix]
      @negative_suffix = match[:negative_suffix]
      @factor          = 1
      @factor          = 100  if match[:special_prefix] == '%' or match[:special_suffix] == '%'
      @factor          = 1000 if match[:special_prefix] == '‰' or match[:special_suffix] == '‰'
      if sig_digits = match[:sig_digits]
        @primary_size   = 0
        @secondary_size = 0
        @min_integers   = 1
        @min_precision  = sig_digits.count('@')
        @max_precision  = sig_digits.size
      else
        @primary_size   = match[:secondary] ? match[:primary].size   : 0
        @secondary_size = match[:ternary]   ? match[:secondary].size : @primary_size
        @min_integers   = match[:primary].count('0')
        @min_precision  = match[:fraction]&.count('0') || 0
        @max_precision  = match[:fraction]&.size || 0
      end
      @primary   = 10**@primary_size
      @secondary = 10**@secondary_size
    end

    # Converts the diven number into a string.
    #
    # @param number [Numeric] number to format
    # @return [String]
    def format(number, digits: nil, display_sign: nil, min_integers: nil, min_precision: nil, max_precision: nil, **)
      number         = number * @factor
      negative       = number < 0
      number         = -number if negative
      prefix, suffix = affixes(display_sign, negative, number == 0)
    
      number   = number.round(max_precision || @max_precision)
      integer  = number.to_i

      %{#{ prefix }#{
        integer(integer, min_integers  || @min_integers) }#{
        fraction(number, min_precision || @min_precision, max_precision || @max_precision) }#{
        suffix }}
    end

    # @private
    def inspect
      "#<#{self.class}:#{pattern.inspect}>"
    end

    private

    def integer(number, min_integers)
      offset = 10 ** (min_integers - 1) if min_integers > 0

      if offset and offset > number
        result = integer(number + offset, 0)
        return result.sub(/^1/, '0')
      end

      if @primary > 1
        number, element = number.divmod(@primary)
        result          = "%0#{number == 0 ? min_integers : @primary_size}d" % element
        while number > 0
          number, element = number.divmod(@secondary)
          element         = "%0#{@secondary_size}d" % element if number > 0
          result          = "#{element},#{result}"
        end
        result
      else
        number.to_s
      end
    end

    def fraction(number, min_precision, max_precision)
      return if max_precision < 1
      return unless fraction = number.to_f.to_s[/\.\d+$/]
      return unless min_precision > 0 or fraction != '.0'
      fraction += '0' while fraction.size - 1 < min_precision
      fraction
    end

    def affixes(sign, negative = false, zero = false)
      case sign&.to_s
      when 'auto', nil
        prefix = negative ? @negative_prefix || "#{@prefix}-" : @prefix
        suffix = negative ? @negative_suffix || @suffix       : @suffix
      when 'never'
        prefix, suffix = @prefix, @suffix
      when 'always'
        prefix = negative ? @negative_prefix || "#{@prefix}-" : "#{@prefix}+"
        suffix = negative ? @negative_suffix || @suffix       : @suffix
      when 'except_zero'
        return(zero ? affixes('never') : affixes('always', negative))
      else
        raise ArgumentError, "invalid display sign property: #{sign.inspect}"
      end
      [prefix, suffix]
    end
  end
end
