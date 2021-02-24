# frozen_string_literal: true

class Nii::RBNF
  # Compile-time class to represent rule sets.
  # @api internal
  class RuleSet
    DESCRIPTOR    = %r{^ (?<bv>[\d\. ,]+) (?:/ (?<rad>[\d\. ,]+) )? (?<suffix>\>*) $}x
    SPECIAL_RULES = %w[ -x 0.x x.0 x.x Inf NaN ]

    # @param name [String] rule set name without the prefix
    # @param prefix [String] either % or %%
    # @param private [true, false] whether or not this rule set is available via RBNF#format
    def initialize(name, prefix: '%', private: false)
      @name, @prefix, @private = name, prefix, private
      @rules         = []
      @special_rules = {}
    end

    # @see Parser#parse
    def add_rule(descriptor, body)
      case descriptor
      when *SPECIAL_RULES then @special_rules[descriptor] = body
      when DESCRIPTOR     then @rules << [descriptor.tr('. ,', ''), body]
      else raise SyntaxError, "invalid descriptor: #{descriptor.inspect}"
      end
    end

    # @see Compiler#compile
    def compile(compiler)
      source = String.new
      method = "#{@prefix}#{@name}"

      SPECIAL_RULES.each { |key| source << compiler.rule(method, key, @special_rules[key]) if @special_rules.include? key }
      @rules.reverse_each { |condition, body| source << compiler.rule(method, condition, body) }
      compiler.define(method, source)

      if @private
        compiler.subject.singleton_class.send(:private, method)
      else
        compiler.subject.rule_sets << @name
      end
    end
  end
end
