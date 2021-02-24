# frozen_string_literal: true

module Nii
  class Territory
    # @api internal
    WORLD_CODE = '001'

    def self.new(code, config = nil)
      return code.to_nii_territory if code.respond_to? :to_nii_territory
      config = Config.new(config)
      code ||= WORLD_CODE

      config.data.cache(:territory, code: code) do
        territory = super(code, config)
        throw :no_cache, territory unless territory.known?
        territory
      end
    end

    # @api internal
    def self._load(code) = new(code)

    # @api internal
    def _dump(level) = code

    attr_reader :code, :config

    def initialize(code, config)
      @config = Config.new(config)
      @code   = @config.data.resolve_alias(:territory, Utils.string(code))
      @data   = {}
    end

    def known?
      config.data.territory_known? code
    end

    def measurement_system
      get(:measurement_system)
    end

    def paper_size
      get(:paper_size)
    end

    def temperature
      get(:temperature)
    end

    def parents
      get(:parents) { |codes| Array(codes).map { |c| Territory.new(c, config) }}
    end

    def territories
      get(:contains) { |codes| Array(codes).map { |c| Territory.new(c, config) }}
    end

    alias_method :children, :territories

    def to_nii_locale
      @locale ||= Locale.new(territory: code)
    end

    def to_nii_territory
      self
    end

    # @private
    def inspect
      names  = config.data.locale_data(:en, :names, :territories, code)
      name   = names['short'] || names['default'] if names
      name ||= code
      name  == code ? "#<#{self.class}:#{code}>" : "#<#{self.class}:#{code} (#{name})>"
    end

    private

    def get(key)
      @data[key] ||= begin
        result = config.dig(key) || config.data.territory_data(code, key)
        result = yield(result) if block_given?
        result&.freeze
      end
    end
  end
end
