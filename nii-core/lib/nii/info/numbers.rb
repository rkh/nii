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

    def initialize(context)
      @systems = {}
      super
    end

    def symbols(system = nil)
      get(system, :symbols)
    end

    def format_rules(type, format = :standard, system: nil)
      get(system, "#{type}_formats", format)
    end

    def spellout(number, *keys, **options) = spellout_rules.format(number, spellout_rule(keys), **options)
    
    def spellout_ordinal(number, *keys, **options) = spellout(number, :ordinal, *keys, **options)
    def spellout_cardinal(number, *keys, **options) = spellout(number, :cardinal, *keys, **options)
    def spellout_year(year, **options) = spellout(year, :year, **options)
  
    def ordinal(number) = ordinal_rules.format(number, 'digits-ordinal')

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
