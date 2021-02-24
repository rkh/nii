# frozen_string_literal: true

module Nii
  # Configuration that only matches certain locales.
  # Can have more specific child configurations.
  # @api internal
  class ConditionalConfig < Config
    def initialize(condition, config, *children)
      @condition = condition
      @children  = children
      super(config)
    end

    def for(locale)
      locale = Nii::Locale.parse(locale)
      return unless applies_for? locale
      child = @children.detect { |c| c.applies_for? locale }
      child&.for(locale) || self
    end

    def empty?
      @condition&.empty? or super
    end

    def applies_for?(locale)
      @condition.nil? or @condition.superset_of? locale
    end

    def except(*keys)
      self.class.new(condition, @options.except(*keys), *children.map { |c| c.except(*keys) }.reject(&:empty?))
    end

    def merge(other)
      other = other.to_nii_config if other.respond_to? :nii_config
      if other.is_a? ConditionalConfig
        if self.children.any?
          raise ArgumentError, 'cannot merge two conditional configurations if both have child configurations' if other.children.any?
          children = self.children.map { |child| child.merge(other.to_h) }
        else
          children = other.children.map { |child| child.reverse_merge(other.to_h) }
        end
        children.reject! { |c| c.empty? }
        new_condition = condition ? condition & other.condition : other.condition
        ConditionalConfig.new(new_condition, @options.merge(other.to_h), *children)
      else
        ConditionalConfig.new(condition, @options.merge(other.to_h), *self.children.map { |c| c.merge(other) })
      end
    end

    def reverse_merge(other)
      other = other.to_nii_config if other.respond_to? :nii_config
      return other.merge(self)    if other.is_a? ConditionalConfig
      merged = ConditionalConfig.new(condition, other.merge(@options), *self.children.map { |c| c.reverse_merge(other) })
      merged = ConditionalConfig.new(nil, other, merged) if condition
      merged
    end

    protected
    attr_reader :condition, :config, :children
  end
end
