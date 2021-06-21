# frozen_string_literal: trues

module Nii::SQL
  # @api internal
  class Connection
    DEFAULT_OPTIONS = { keep_reference: false, cache_schema: true, test: true }
    SEQUEL_OPTIONS  = %i[
      adapter database extensions cache_schema extensions
      host password preconnect preconnect_extensions quote_identifiers
      servers sql_log_level user max_connections pool_timeout single_threaded
    ]

    DB_TYPES = { mysql2: :mysql, amalgalite: :sqlite }
    ADAPTERS = { sqlite3: :sqlite }

    private_constant :SEQUEL_OPTIONS, :DEFAULT_OPTIONS, :DB_TYPES, :ADAPTERS

    # @return [Nii::Config]
    attr_reader :config
    
    # @return [Sequel::Database]
    attr_reader :db

    # @return [Symnbol] database type (mysql2 will be mapped to mysql, etc)
    attr_reader :type

    # @param config [Nii::Config]
    def initialize(config)
      @db            = connection_for(config.connection)
      @type          = DB_TYPES.fetch(connection.adapter_scheme, connection.adapter_scheme)
      @active_record = Array(db.opts[:extensions]).include? :activerecord_connection
    end

    # @return [true, false] whether or not we are reusing the ActiveRecord connection
    def active_record? = @active_record

    # @return [true, false] whether or not we are using a SQLite database
    def sqlite? = type == :sqlite

    # @return [true, false] whether or not we are using a PostgeSQL database
    def postgres? = type == :postgres

    # @return [true, false] whether or not we are using a SQLite database
    def mysql? = type == :mysql

    private

    def connection_for(object)
      case object
      when Sequel::Database    then return object
      when nil                 then return connect(config)
      when Hash, Nii::Config   then return connect(config.merge(object))
      when /^sequel$/i         then return sequel_connection
      when /^active_?record$/i then return active_record_connection
      when String, URI         then return connect(object, config)
      end

      model = active_record_model(object)
      return active_record_connection(model) if model
      raise SetupError, "unsupported database connection: #{object.inspect}"
    end

    def active_record_model(object)
      return unless defined? ActiveRecord::Base
      return object             if object.is_a? Class and object <= ActiveRecord::Base
      return ActiveRecord::Base if object == ActiveRecord::Base.connection
    end

    def connect(uri = nil, options)
      uri, options = connection_options(uri, options)
      uri ? Sequel.connect(uri, options) : Sequel.connect(options)
    end

    def connection_options(uri = nil, options)
      options           = options.to_nii_config.slice(SEQUEL_OPTIONS).to_h if options.respond_to? :to_nii_config
      options           = options.transform_keys(&:to_sym)
      options           = DEFAULT_OPTIONS.merge(options)
      adater            = options[:adapter]&.to_sym
      options[:adapter] = ADAPTERS.fetch(adapter, adapter)
      uri             ||= config.database_uri || config.database_url
      uri             &&= Nii::Utils.string(uri)
      [ uri, options.compact ].compact
    end

    def sequel_connection
      return ::Sequel::DATABASES.last if ::Sequel::DATABASES.any?
      raise SetupError, 'No Sequel connection established'
    end

    def active_record_connection(model = config.model || ActiveRecord::Base)
      adapter = model.connection.adapter_name.downcase.to_sym
      connection_for(adapter: adapter, extensions: :activerecord_connection).tap { _1.activerecord_model = model }
    end
  end
end
