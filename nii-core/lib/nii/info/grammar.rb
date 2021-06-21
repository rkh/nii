# frozen_string_literal: true

module Nii::Info
  class Grammar < Generic
    # @return [String] "formal", "informal", or "avoid".
    def formality = config.formality || locale.formality || config.default_formality || 'avoid'
    alias_method :tone, :formality

    # @return [true, false]
    def formal? = formality == 'formal'

    # @return [true, false]
    def informal? = formality == 'informal'

    # @example
    #   context = Nii::Context.new :de
    #   context.grammar.cases # => ["nominative", "genitive", "dative", "accusative"]
    #
    # @param category [Symbol, String, nil] Object category for cases.
    #
    # @return [Array<String>] list of grammatical cases.
    def cases(category = nil)
      result   = locale_info(:grammar, :cases, category) if category
      result ||= locale_info(:grammar, :cases, :default)
      Array(result)
    end

    # @example
    #   Nii::Context.new(:en).grammar.has_cases? # => false
    #   Nii::Context.new(:de).grammar.has_cases? # => true
    #
    # @return [true, false] whether or not the current language features grammatical cases
    def has_cases? = cases.any?

    # @param case_name [Symbol, String, #to_s] case to check
    # @param (see #cases)
    # @return [true, false] whether or not the current language knows the given grammatical case
    def has_case?(case_name, category = nil) = cases(category).include?(Nii::Utils.string(case_name))

    # @example
    #   Nii::Context.new(:ar).grammar.definiteness # => ["definite", "indefinite", "construct"]
    #   Nii::Context.new(:sv).grammar.definiteness # => ["definite", "indefinite"]
    #
    # @return [Array<String>] list of definiteness forms as grammatical constructs (ie, beyond definite/indefinite articles)
    def definiteness = Array(locale_info(:grammar, :definiteness))

    # @overload has_definiteness?
    #   @example
    #     Nii::Context.new(:ar).grammar.has_definiteness? # => true
    #     Nii::Context.new(:en).grammar.has_definiteness? # => false
    #
    #   @return [true, false]
    #     whether or not the current language features explicit definiteness as grammatical constructs
    #     beyond definite/indefinite articles
    #
    # @overload has_definiteness?(type)
    #   @param type [String, Symbol] definiteness form to check.
    #   @return [true, false]
    #     whether or not the current language has an explicit grammatical form for the given type of definiteness
    def has_definiteness?(type = nil) = type ? definiteness.include?(Nii::Utils.string(type)) : definiteness.any?

    # @example
    #   context = Nii::Context.new :pl
    #   context.grammar.genders        # => ["animate", "inanimate", "personal", "feminine", "neuter"]
    #   context.grammar.genders :units # => ["inanimate", "feminine", "neuter"]
    #
    # @param category [Symbol, String, nil]
    #   Object category for genders.
    #   Example categories are +nominal+, +units+, or +person_list+.
    #
    # @return [Array<String>] list of grammatical genders.
    def genders(category = nil)
      result   = locale_info(:grammar, :genders, category) if category
      result ||= locale_info(:grammar, :genders, :nominal)
      Array(result)
    end

    # @example
    #   Nii::Context.new(:en).grammar.has_genders? # => false
    #   Nii::Context.new(:de).grammar.has_genders? # => true
    #
    # @return [true, false] whether or not the current language features grammatical genders
    def has_genders? = genders.any?

    # @param gender [Symbol, String, #to_s] gender to check
    # @param (see #genders)
    # @return [true, false] whether or not the current language knows the given grammatical gender
    def has_gender?(gender, category = nil) = genders(category).include?(Nii::Utils.string(gender))

    # @example
    #   context = Nii::Context.new :en
    #   context.grammar.plurals.classify 1 # => :one
    #
    # @return [Nii::Plurals] Plural category classifier object.
    def plurals
      data.cache(:plurals, context.data_locale, :info, :plurals) do |rules|
        Nii::Plurals.new(**rules.transform_keys(&:to_sym))
      end
    end

    # @example English has plural forms, but Chinese does not
    #   Nii::Context.new(:en).grammar.has_plurals? # => true
    #   Nii::Context.new(:zh).grammar.has_plurals? # => false
    #
    # @example German has cardinal plural forms, but lacks ordinal plural forms
    #   context = Nii::Context.new :de
    #   context.grammar.has_plurals? :cardinal # => true
    #   context.grammar.has_plurals? :ordinal  # => false
    #
    # @param category [String, Symbol, nil] Plural form category, either +cardinal+ (default) or +ordinal+.
    # @return [true, false] whether or not the current language features grammatical plural forms.
    def has_plurals?(category = nil) = plurals.categories(category) != [:other]

    # @example Welsh has a special plural form for zero
    #   Nii::Context.new(:en).grammar.has_plural? :zero # => false
    #   Nii::Context.new(:cy).grammar.has_plural? :zero # => true
    #
    # @param plural_form [String, Symbol] Plural form to check.
    # @param category [String, Symbol, nil] Plural form category, either +cardinal+ (default) or +ordinal+.
    # @return [true, false] whether or not the current language features the given grammatical plural form.
    def has_plural?(plural_form, category = nil) = plurals.categories(category).include?(Nii::Utils.symbol(plural_form))
  end
end
