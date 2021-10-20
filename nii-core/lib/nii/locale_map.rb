# frozen_string_literal: true

module Nii
  class LocaleMap
    def initialize(data = nil)
      @map = Concurrent::Map.new
      data&.each_pair { self[_1] = _2 }
    end

    def localize(context, use_fallback: true, **options)
      Context.new(context).with_fallbacks(use_fallback: use_fallback) do |context|
        result = self[context.locale]
        context.localize(result, **options) if result
      end
    end

    alias_method :nii_localize, :localize

    # @return [true, false]
    def include?(locale, inherit: true)
      return @map.include?(Nii::Locale[locale].code) unless inherit
      Nii::Locale[locale].lookup.any? { @map.include?(_1.code) }
    end

    # @return [true, false]
    def empty? = @map.size == 0
    alias_method :blank?, :empty?

    # @return [true, false]
    def present? = !blank?

    # @param [String, Symbol, Nii::Locale, nil] locale
    # @return [Object]
    def [](locale, inherit: true, default: nil)
      Nii::Locale[locale].lookup.each do |locale|
        result = @map[locale.code]
        return result || default if result or !inherit
      end
      default
    end

    # @param [String, Symbol, Nii::Locale, nil] locale
    # @param [Object] value
    def []=(locale, value)
      return @map.delete(Nii::Locale[locale].code) if value.nil?
      @map[Nii::Locale[locale].code] = value
    end

    def each_pair(&block) = @map.each_pair(&block)

    def to_h = each_pair.to_h

    # @private
    def inspect = "#<#{self.class.inspect}:#{to_h.inspect}>"
  end
end
