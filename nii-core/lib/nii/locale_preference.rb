# frozen_string_literal: true

module Nii
  # A locale preference is a collection of locales that behaves like it is a union of all the locales it includes.
  # It is used under the hood by Nii for content negotiation.
  #
  # @example
  #   # simplified locale negotiation
  #   preference = Nii::LocalePreference.new("fr-FR;q=1.0,de-AT;q=0.9,de-DE;q=0.8")
  #   available  = Nii::LocalePreference.new(:en, :de)
  #   possible   = preference & available
  #
  #   possible.first # => #<Nii::Locale:de-AT>
  #   possible.to_s  # => "de-AT, de-DE"
  class LocalePreference
    CACHE = Nii::Cache.new
    private_constant :CACHE

    include Enumerable

    # @api internal
    def self._load(data) = new(data)

    # @api internal
    def _dump(level) = to_s

    # List of locales in order of preference. Also usable for pattern matching.
    # @return [Array<Nii::Locale>]
    attr_reader :locales
    alias_method :to_a,        :locales
    alias_method :deconstruct, :locales

    # @overload new(accept_languages)
    #   Creates a locale preference from an HTTP header.
    #
    #   @example
    #     Nii::LocalePreference.new("fr-FR;q=1.0,de-DE,en")
    #     # => #<Nii::LocalePreference:[#<Nii::Locale:fr-FR>, #<Nii::Locale:de-DE>, #<Nii::Locale:en>]>
    #
    #   @param accept_languages [String] valid value for an HTTP Accept-Language header
    #   @return [Nii::LocalePreference]
    #
    # @overload new(*locales, **options)
    #   Creates a locale preference from a list of locales and/or locale options.
    #
    #   @example
    #     Nii::LocalePreference.new(:en, :fr)         # => #<Nii::LocalePreference:[#<Nii::Locale:en>, #<Nii::Locale:fr>]>
    #     Nii::LocalePreference.new(:en, region: :us) # => #<Nii::LocalePreference:[#<Nii::Locale:en-US>]>
    #     
    #   @param locales [Array<String, Symbol, Nii::Locale, #to_nii_locale>]
    #   @option (see Nii::Locale.new)
    #   @return [Nii::LocalePreference]
    def self.new(*locales, **options)
      CACHE.fetch(locales, options) do
        locales = Nii::Parser.accept(locales)
        locales.map! { |l| l.with(**options) } if options.any?
        super(*locales)
      end
    end

    # @api internal
    def initialize(*locales)
      @locales = locales.freeze
      @cache   = Nii::Cache.new
    end

    # Loops through all locales.
    # @yield [locale] Block called for each locale.
    # @yieldparam locale [Nii::Locale]
    def each(&block) = locales.each(&block)

    # @return [true, false] whether or not the list of locales is empty
    def empty? = @locales.empty?

    # @return [Nii::Locale, nil] the first entry in the list of locales
    def first = @locales.first

    # A locale preference with the same locales except without any extensions.
    #
    # @example
    #   Nii::LocalePreference.new('en-US', 'de-DE-x-informal').without_extensions
    #   # => #<Nii::LocalePreference:[#<Nii::Locale:en-US>, #<Nii::Locale:de-DE>]>
    #
    # @see Nii::Locale#without_extensions
    # @return [Nii::LocalePreference]
    def without_extensions = @without_extensions ||= LocalePreference.new(locales.map(&:without_extensions).uniq)

    # @example
    #   preferece = Nii::LocalePreference.new('de-DE', 'de-AT')
    #   preference.subset_of? 'de'    # => true
    #   preference.subset_of? 'de-DE' # => false
    #
    # @param other [Nii::LocalePreference, Nii::Locale, String, #to_nii_locale]
    # @return [true, false] wether or not the list of locales is a subset of the given argument
    # @see Nii::Locale#subset_of?
    def subset_of?(other)
      return false if empty?
      other = Locale.parse(other, complain: true) unless other.respond_to? :superset_of?
      locales.all? { |locale| other.superset_of? locale }
    end

    def superset_of?(other)
      return false if empty?
      other = Locale.parse(other, complain: true) unless other.respond_to? :subset_of?
      locales.any? { |locale| other.subset_of? locale }
    end

    # @return [true, false]
    #   whether or not there is any overlap between the locale preference and the given argument
    #
    # @note If this method returns false, the result of calling +preference & other+ will be an empty preference.
    # @see Nii::Locale.combinable?
    def combinable?(other)
      return false if empty?
      locales.any? { |l| l.combinable? other }
    end

    # @param other [Nii::LocalePreference, Nii::Locale]
    # @return [Nii::LocalePreference]
    # @see Nii:Locale#&
    def &(other)
      return self if other.nil?
      locales = self.locales.map { |l| l & other if l.combinable? other }.compact
      LocalePreference.new(locales)
    end

    # @param other [Nii::LocalePreference, Nii::Locale]
    # @return [Nii::LocalePreference]
    # @see Nii:Locale#|
    def |(other)
      return self if other.nil? or locales.include? other
      LocalePreference.new(other, locales.reject { |l| l.subset_of? other })
    end

    # Creates a new locale preference containing locales from both preference lists.
    #
    # @param other [Nii::LocalePreference, Nii::Locale]
    # @return [Nii::LocalePreference]
    def +(other) = LocalePreference.new(self, other)

    # Locale preferences as HTTP compatible string (without qualifiers,
    # can be used for Accept-Language request header and Content-Language response header)
    # @return [String] list of locales
    def to_s = @to_s ||= locales.join(', ').freeze

    # @private
    def inspect = "#<#{self.class.inspect}:#{locales.inspect}>"
  end
end
