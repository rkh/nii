# frozen_string_literal: true

module Nii
  class Plurals
    NUMBER   = /((?:\d+\.\d+|\.\d+|\d+)(?:[Eec]-?\d+)?)/
    EXPONENT = /[Eec](-?\d+)$/
    FRACTION = /\.(\d+)/
    TRAIL    = /0+$/
    private_constant :NUMBER, :FRACTION, :TRAIL

    def initialize(cardinal:, ordinal:, ranges: {})
      @categories = { }
      @ranges = ranges.transform_values(&:to_sym)
      compile_rules(:cardinal, cardinal)
      compile_rules(:ordinal,  ordinal)
    end

    def categories(type = :cardinal)
      @categories.fetch(type.to_sym) { [:other] }
    end

    def classify(type = :cardinal, number)
      case number
      when Range   then range(type, number.begin, number.end)
      when Numeric then classify(type, Utils.string(number))
      when NUMBER  then @categories.include?(type.to_sym) ? send("_#{type}", $1) : :other
      when String  then raise ArgumentError, "argument must be a decimal number in latin script"
      else
        raise ArgumentError, "cannot classify #{number.class}" unless number.respond_to? :count
        classify(type, number.count)
      end
    end
    alias_method :call, :classify

    def range(type = :cardinal, first, last)
    end

    private

    def compile_rules(type, rules)
      source     = String.new
      categories = @categories[type] = {}

      rules.each do |key, rule|
        key = key.to_sym
        categories << key
        source << "return #{key.inspect} if #{Parser.plural(rule)};" unless key == :other
      end

      instance_eval <<-RUBY
        # frozen_string_literal: true
        private def _#{type}(number)          
          _f = number[FRACTION, 1]
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
      RUBY
    end
  end
end
