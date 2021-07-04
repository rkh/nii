# frozen_string_literal: true

module Nii::Info
  # This will be exposed as {Nii::Context#numbers}.
  # @see Nii::Context#method_missing
  class Numbers < Generic
    OVERRIDE_SYSTEMS = [nil, 'default', 'native', 'traditional', 'finance']
    SYSTEM_MAP       = {
      'default'      => { 'finance' => 'default' },
      'native'       => { 'default' => 'native', 'finance' => 'native' },
      'traditional'  => { 'default' => 'traditional' }
    }
    private_constant :OVERRIDE_SYSTEMS, :SYSTEM_MAP

    # @api internal
    def initialize(context)
      @systems = {}
      super
    end

    # @api internal
    def symbols(system = nil) = get(system, :symbols)

    # @api internal
    def format_rules(type, format = :standard, system: nil) = get(system, "#{type}_formats", format)

    # Spells out a number.
    #
    # @example Spellout options for English
    #   nii = Nii::Context.new :en
    #   nii.numbers.spellout 115                      # => "one hundred fifteen"
    #   nii.numbers.spellout 2020                     # => "two thousand twenty"
    #   nii.numbers.spellout 2020, :year              # => "twenty twenty"
    #   nii.numbers.spellout 115,  :verbose           # => "one hundred and fifteen"
    #   nii.numbers.spellout 115,  :ordinal           # => "one hundred fifteenth"
    #   nii.numbers.spellout 115,  :ordinal, :verbose # => "one hundred and fifteenth"
    #
    # @example Spellout options for Catalan
    #   nii = Nii::Context.new :ca
    #   nii.numbers.spellout 115                        # => "cent-quinze"
    #   nii.numbers.spellout 1                          # => "u"
    #   nii.numbers.spellout 1,    :masculine           # => "un"
    #   nii.numbers.spellout 1,    :feminine            # => "una"
    #   nii.numbers.spellout 115,  :ordinal, :masculine # => "cent-quinzè"
    #   nii.numbers.spellout 115,  :ordinal, :feminine  # => "cent-quinzena"
    #
    # @param number [Numeric]
    #
    # @param rules [Array<Symbol, String>]
    #   specific rules to use (cardinal/ordinal/year, gender, case, plural, verbose).
    #   See the documentation for the specific language on examples.
    #
    # @return [String]
    def spellout(number, *rules) = spellout_rules.format(number, spellout_rule(rules))
    
    # Spells out a number as a year. In English, 2020 will become "twenty twenty" instead of "two thousand twenty".
    #
    # @see #spellout
    # @param number [Numeric]
    # @return [String]
    def spellout_year(year) = spellout(year, :year)
  
    # Formats a number as ordinal
    #
    # @example Ordinal numbers in English
    #   nii = Nii::Context.new :en
    #   nii.numbers.ordinal 1  # => "1st"
    #   nii.numbers.ordinal 42 # => "42nd"
    #
    # @example Ordinal numbers in Swedisch
    #   nii.numbers.ordinal 1, :neuter    # => "1:a"
    #   nii.numbers.ordinal 1, :masculine # => "1:e"
    #
    # @param number [Numeric]
    # @param rule [nil, Symbol, String] special rule to use (case, gender, etc)
    # @return [String]
    def ordinal(number, rule = nil)
      ordinal_rules.format(number, "digits-ordinal#{"-#{rule}" if rule}")
    rescue ArgumentError
      ordinal_rules.format(number, 'digits-ordinal')
    end

    # Rules for spelling out numbers.
    # @see #spellout
    # @return [Nii::RBNF]
    def spellout_rules = rbnf(:spellout_rules)

    # Rules for formatting ordinal numbers (1th, 2nd, etc).
    # @see #ordinal
    # @return [Nii::RBNF]
    def ordinal_rules = rbnf(:ordinal_rules)

    # @overload classify(type = nil, number, complain: true)
    #   @param (see Nii::Plurals#classify)
    #   @return (see Nii::Plurals#classify)
    def plural_category(...) = context.grammar.plurals.classify(...)

    # def misc_patterns(*keys, system: nil)
    #   get(system, :misc_patterns, *keys)
    # end

    # @param key [Symbol, String, nil]
    #   Indicates which numbering system to use.
    #   Should either be a known identifier (+latn+, +arab+, etc) or one of the
    #   special identifiers +default+, +finance+, +native+, or +traditional+.
    #
    # @return [Nii::NumberingSystem::Generic]
    def system(key = nil)
      return key.to_nii_number_system if key.respond_to? :to_nii_number_system
      key = Nii::Utils.string(key || 'default')

      if map = SYSTEM_MAP[config.numbering_system || 'default']
        key  = map[key] || key
      elsif OVERRIDE_SYSTEMS.include? key
        key  = config.numbering_system if config.numbering_system?
      end

      key = locale.numbering_system || key if OVERRIDE_SYSTEMS.include? key
      key = locale_info(:numbers, :other_numbering_systems, key) || key
      key = 'default' unless key and data.numbering_system_known? key

      @systems[key] ||= begin
        default = locale_info(:numbers, :default_numbering_system)
        key     = default.fetch(key, key) if default.is_a? Hash
        key     = default if key == 'default'
        data.numbering_system(key)
      end
    end

    # @param code [nil, Symbol, String, #to_nii_currency]
    # @return [Nii::Currency, nil] currency for the given code (or default currency if no code is given).
    def currency(code = nil)
      return code.to_nii_currency if code.respond_to? :to_nii_currency
      code ? Nii::Currency[code] : context.currency
    end

    private

    def rbnf(key) = data.cache(:rbnf, context.data_locale, :rbnf, key) { Nii::RBNF.load(_1, plurals: context.grammar.plurals) }
    
    def spellout_rule(keys)
      data.cache(:spellout_rule, locale: context.data_locale, keys: keys) do
        available = spellout_rules.rule_sets
        base      = keys.join('-')
        possible  = ["spellout-#{base}", "spellout-cardinal-#{base}", "spellout-numbering-#{base}", base, "spellout-numbering"]
        possible.detect { available.include? _1 }
      end
    end

    def get(system, key, *keys)
      keys.compact!
      result = locale_info(:numbers, key, system(system).code)
      result = result.dig(*keys.map { Nii::Utils.string(_1) }) if keys.any? and result
      result
    end
  end
end
