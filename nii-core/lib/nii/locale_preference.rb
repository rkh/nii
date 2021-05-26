# frozen_string_literal: true

module Nii
  class LocalePreference
    CACHE = Nii::Cache.new
    private_constant :CACHE

    # @api internal
    def self._load(data) = new(data)

    # @api internal
    def _dump(level) = to_s

    attr_reader :locales
    alias_method :to_a, :locales

    def self.new(*locales, **options)
      CACHE.fetch(locales, options) do
        locales = Nii::Parser.accept(locales)
        locales.map! { |l| l.with(**options) } if options.any?
        super(*locales)
      end
    end

    def initialize(*locales)
      @locales = locales.freeze
      @cache   = Nii::Cache.new
    end

    def empty? = @locales.empty?

    def first = @locales.first

    def without_extensions = @without_extensions ||= LocalePreference.new(locales.map(&:without_extensions).uniq)

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

    def combinable?(other)
      return false if empty?
      locales.any? { |l| l.combinable? other }
    end

    def &(other)
      locales = self.locales.map { |l| l & other if l.combinable? other }.compact
      LocalePreference.new(locales)
    end

    def |(other)
      return self if locales.include? other
      LocalePreference.new(other, locales.reject { |l| l.subset_of? other })
    end

    def deconstruct = to_a

    def +(other) = LocalePreference.new(self, other)
    def to_s = @to_s ||= locales.join(', ').freeze

    def inspect
      "#<#{self.class.inspect}:#{locales.inspect}>"
    end
  end
end
