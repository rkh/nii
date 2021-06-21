# frozen_string_literal: trues

module Nii::SQL
  class Lookup < Nii::Lookup::Common
    # @api internal
    def self.config = @config ||= {}

    # @api internal
    def self.adapter(value) = config[:adapter] = value
    
    # @api internal
    def self.register(*list) = list.each { Nii::Lookup[_1] = self }

    def create_table = schema.create
    
    def drop_table = schema.drop

    private

    attr_reader :connection, :schema, :base_queries

    def setup
      @config       = config.merge(self.class.config)
      @connection   = Connection.new(config)
      @schema       = Schema.new(connection, config)
      @base_queries = {}
      super
    end

    def reset!
      schema.reset
      base_queries.clear
      super
    end

    def base_query(locale)                = base_queries[locale] ||= schema.base_query(locale)
    def load_namespace(locale, namespace) = schema.cache_class.new(base_query(locale).where(namespace: namespace))
    def lookup(query_cache, message)      = query_cache.get(message, reload: config.reload_templates?)
    def scan_locales                      = config.available_locales? ? Array(config.available_locales) : schema.locale_query.all
  end
end
