require "active_record/connection_adapters/postgresql_adapter"
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestamptz
