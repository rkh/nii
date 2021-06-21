# frozen_string_literal: trues

module Nii::SQL
  class Schema
    autoload :DSL, 'nii/sql/schema/dsl'

    REGISTER   = {}
    ROW_SCOPES = %i[ name namespace locale ]
    private_constant :REGISTER, :ROW_SCOPES

    def self.define(key, &block) = REGISTER[Nii::Utils.symbol(key)] = block

    # @param connection [Nii::SQL::Connection]
    # @param config [Nii::Config]
    # @api internal
    def initialize(connection, config)
      @connection = connection
      @config     = Nii::Config.new(config)
      @lock       = Concurrent::ReentrantReadWriteLock.new
      definition  = config.schema || :default

      unless definition.respond_to? :call
        definition = definition.to_sym
        require "nii/sql/schema/#{definition}" unless REGISTER.include? definition
        definition = REGISTER.fetch(definition)
      end

      @definition = definition
      reset
    end

    def reset
      @lock.with_write_lock do
        @base_query   = nil
        @row_scope    = nil
        @locale_query = nil
      end
    end

    def create = @lock.with_write_lock { DSL::Create.new(@connection,  @definition) }
    def drop = @lock.with_write_lock { DSL::Drop.new(@connection, @definition) }

    # @return [Symbol] scope of a row (+name+, +namespace+, or +locale+)
    # @api internal
    def row_scope
      row_scope = @row_scope # copy reference to avoid race condition
      return row_scope if row_scope

      @lock.with_read_lock do
        columns    = base_query.columns
        @row_scope = ROW_SCOPES.detect { columns.include? _1 }
        raise Nii::Errors::SetupError, "dataset has to contain at least one of: #{ROW_SCOPES.join(', ')}" unless @row_scope
        @row_scope
      end
    end

    # @api interanl
    def base_query(locale)
      base_query = @base_query # copy reference to avoid race condition
      return base_query if base_query
      @lock.with_write_lock { @base_query ||= DSL::BaseQuery.new(@connection, @definition, locale: locale).dataset }
    end

    # @api interanl
    def cache_class
      @lock.with_read_lock do
        todo
      end
    end

    # @api internal
    def locale_query
      locale_query = @locale_query # copy reference to avoid race condition
      return locale_query if locale_query
      @lock.with_write_lock { @locale_query ||= DSL::LocaleQuery.new(@connection, @definitions).dataset }
    end
  end
end
