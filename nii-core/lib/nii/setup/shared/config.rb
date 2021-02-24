# frozen_string_literal: true

module Nii::Setup::Shared
  # Shared logic for any setup block that ends up generating a {Nii::Config}
  # @api internal
  module Config
    def initialize(*) = @config ||= {}
    def to_nii_config = Nii::Config.new(@config)

    protected

    def include?(key) = @config.include?(key.to_sym)
    def [](key)       = @config.fetch(key.to_sym) { yield if block_given? }
    def []=(key, value)
      @config[key.to_sym] = value
    end

    private

    def reject?(config) = config.empty?
    def set(key, value = Nii::UNDEFINED, default = Nii::UNDEFINED, &block)
      self[key] = cast(value, &block)   unless value   == Nii::UNDEFINED
      self[key] = cast(default, &block) unless default == Nii::UNDEFINED or include? key
      self[key]
    end

    def add(key, values, &block)
      list = self[key] ||= []
      Array(values).flatten.each { |value| list << cast(value, &block) }
      list
    end

    def cast(value)
      return if value == Nii::UNDEFINED
      block_given? ? yield(value) : value
    end

    def prepare_config
    end
  end
end
