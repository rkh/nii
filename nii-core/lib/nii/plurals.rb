# frozen_string_literal: true

module Nii
  # Plural cagetorization implementation. Access these via {Nii::Info::Grammar#plurals}.
  #
  # In most cases you won't have to use this object directly, the message template will take care of this.
  #
  # @example
  #   context = Nii::Contex.new 'en'
  #   context.grammar.plurals.classify(:ordinal, 23) # => :few
  class Plurals
    NUMBER   = /((?:\d+\.\d+|\.\d+|\d+)(?:[Eec]-?\d+)?)/
    EXPONENT = /[Eec](-?\d+)$/
    FRACTION = /\.(\d+)/
    TRAIL    = /0+$/
    private_constant :NUMBER, :FRACTION, :TRAIL, :EXPONENT

    # @api internal
    def initialize(cardinal:, ordinal:, ranges: {})
      @categories     = { }
      @ranges         = ranges.inject({}) do |hash, (key, value)|
        first, second = key.split('-').map(&:to_sym)
        hash.merge! first => hash[first].to_h.merge(second => value.to_sym)
      end

      compile_rules(:cardinal, cardinal)
      compile_rules(:ordinal,  ordinal)
    end

    # @param type [Symbol, #to_sym] Plural category type (+cardinal+ or +ordinal+).
    # @return [Array<Symbol>] List of categories for the category type.
    def categories(type = :cardinal)
      @categories.fetch(type.to_sym) { [:other] }
    end

    # Classifies a number or range of numbers. Number can be a String representation as well, which allows the
    # Implementation to differentiate between 1.50 and 1.5.
    #
    # Will call {#range} if a range object is given.
    #
    # You can also pass a symbol as number, in which case it will be treated as a plural category (if it is valid,
    # it becomes the return value, otherwise +other+ will be returned).
    #
    # @param (see #categories)
    # @param number [String, Numeric, Range, Symbol]
    # @return [Symbol] Plural category for the given number.
    def classify(type = :cardinal, number)
      case number
      when Range   then range(type, number.begin, number.end)
      when Numeric then classify(type, Utils.string(number))
      when NUMBER  then @categories.include?(type.to_sym) ? send("_#{type}", $1) : :other
      when String  then raise ArgumentError, "argument must be a decimal number in latin script"
      when Symbol  then categories(type).include?(number) ? number : :other
      else
        raise ArgumentError, "cannot classify #{number.class}" unless number.respond_to? :count
        classify(type, number.count)
      end
    end
    alias_method :call, :classify

    # Classifies a number or range of numbers.
    #
    # @param (see #categories)
    # @param first [String, Numeric, Symbol]
    # @param last  [String, Numeric, Symbol]
    # @return [Symbol] Plural category for the given numeric range from +first+ to +last+.
    # @note For English, this will always return +other+.
    def range(type = :cardinal, first, last)
      first, last = last, first if last < first
      @ranges.fetch(classify(type, first)) { return :other }.fetch(classify(type, last), :other)
    end

    private

    def compile_rules(type, rules)
      verbose_was = $VERBOSE
      source      = String.new
      categories  = @categories[type] = []

      rules.each do |key, rule|
        key = key.to_sym
        categories << key
        source << "return #{key.inspect} if #{Parser.plural(rule)}\n" unless key == :other
      end

      $VERBOSE = false
      instance_eval <<-RUBY
        # frozen_string_literal: true
        class << self
          private def _#{type}(number)
            _f = number[FRACTION, 1] || ''
            _t = _f.sub(TRAIL, '')
            _n = Float(number.tr('c', 'e'))
            i  = _n.to_i
            n  = _n == i ? i : _n

            if number =~ EXPONENT
              c = e = $1.to_i
              _f = _f[c..-1]
              _t = _t[c..-1]
            else
              c = e = 0
            end

            v, f = _f.size, _f.to_i
            w, t = _t.size, _t.to_i

            #{source}
            :other
          end
        end
      RUBY
    ensure
      $VERBOSE = verbose_was
    end
  end
end
