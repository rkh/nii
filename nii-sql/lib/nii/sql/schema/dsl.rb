# frozen_string_literal: trues

module Nii::SQL
  # @api internal
  module Schema::DSL
    class Generic
      def initialize(connection, definition, **options)
        @connection = connection
        @db         = connection.db
        @options    = options
        @table      = nil

        if definition.respond_to? :arity and definition.arity == 0
          instance_eval(&definition)
        else
          definition.call(self)
        end
      end

      def table(*names) = names.detect { @db.has_table? _1 }
    end

    class BaseQuery < Generic
      def table(*names, &callback)
        @table = super
        todo
      end

      def column(name, *columns, required: false, **options, &callback)
        todo
      end
    end

    class LocaleQuery < BaseQuery
    end

    class Create < Generic
      OPTIONS = {
        default:    { type: String },
        name:       { index: true  },
        namespace:  { index: true  },
        content:    { type: :text  },
        format:     { null: false  },
        id:         { name: :id    },
        updated_at: { type: DateTime, null: false },
        created_at: { type: DateTime, null: false },
        locale:     { index: true, default: 'und', null: false },
      }

      def table(*names, create: true, id: true, timestamps: false, created_at: timestamps, updated_at: timestamps, **)
        return unless create        
        @table = create == true ? names.first : create
        create_table(@table) do |sequel|
          @sequel = sequel
          create_id(id) if id
          yield(self)

          created_at = :created_at if created_at == true
          updated_at = :updated_at if updated_at == true

          column :created_at, created_at if created_at
          column :updated_at, updated_at if updated_at
        end
      end

      def column(name, *columns, create: true, **options &callback)
        return unless name.is_a? Symbol
        return if !create or columns.any? { @columns.include? _1 }

        case create
        when true   then options, column = {}, columns.first
        when Symbol then options, column = {}, create
        when Hash   then options, column = create, create[:name] || columns.first
        else raise ArgumentError, "invalid value for create options: #{create.inspect}"
        end

        options = OPTIONS[:default].merge(OPTIONS[name].to_h).merge(options)
        @sequel.column column, options[:type], options
      end

      private

      def create_id(id)
        return create_id({})       if id == true
        return create_id(name: id) if id.is_a? Symbol

        options = OPTIONS[:id].merge(id.to_h)
        
        if options.delete(:uuid) and !options[:type] and use_uuid?
          case connection.type
          when :postgres
            @db.run 'CREATE EXTENSION IF NOT EXISTS pgcrypto'
            options[:type] = :uuid
            options[:default] ||= Sequel.function(:gen_random_uuid)
          when :mysql
            options[:type] = 'binary(16)'
            options[:default] ||= Sequel.function(:uuid_to_bin, Sequel.function(:uuid))
          end
        end

        @sequel.primary_key options[:name], options
      end

      def use_uuid?
        return true if @connection.postgres?
        @connection.mysql? and @db.server_version >= 80013
      end
    end

    class Drop < Generic
      def table(*names, create: true, drop: create, **, &callback)
        @db.drop_table(drop == true ? names.first : drop) if drop
      end
    end
  end
end
