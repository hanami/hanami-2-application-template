# frozen_string_literal: true

require_relative "database_config"

module Hanami
<<<<<<< HEAD:lib/hanami/cli/application/commands/db/utils/database.rb
  class CLI
    module Application
      module Commands
        module DB
          module Utils
            class Database
              def self.for_application(application)
                application.init_bootable :persistence

                new(
                  config: application["persistence.config"],
                  root_path: application.root,
                )
              end
=======
  module CLI
    module Commands
      module DB
        module Utils
          class Database
            attr_reader :application, :config
>>>>>>> 5c0acc5 ([wip] add pry-buybug):lib/hanami/cli/commands/db/utils/database.rb

            SCHEME_MAP = {
              "sqlite" => -> {
                require_relative("sqlite")
                Sqlite
              },
              "postgres" => -> {
                require_relative("postgres")
                Postgres
              },
              "mysql" => -> {
                require_relative("mysql")
                Mysql
              }
            }.freeze

            def self.[](application)
              config = DatabaseConfig.new(application.settings.database_url)

              resolver = SCHEME_MAP.fetch(config.db_type) do
                raise "#{config.db_type} is not a supported db scheme"
              end

              klass = resolver.()

              klass.new(application: application, config: config)
            end

            def initialize(application:, config:)
              @application = application
              @config = config
            end

            def root_path
              application.root
            end

            def rom_config
              @rom_config ||=
                begin
                  application.init_bootable(:persistence)
                  application.container["persistence.config"]
                end
            end

            def name
              config.db_name
            end

            def applied_migrations
              sequel_migrator.applied_migrations
            end

            def gateway
              rom_config.gateways[:default]
            end

            def connection
              gateway.connection
            end

            def run_migrations(**options)
              require "rom/sql"
              ROM::SQL.with_gateway(gateway) do
                migrator.run(options)
              end
            end

            def migrator
              @migrator ||=
                begin
                  require "rom/sql"
                  ROM::SQL::Migration::Migrator.new(connection, path: File.join(root_path, "db/migrate"))
                end
            end

            def applied_migrations
              sequel_migrator.applied_migrations
            end

            private

            def sequel_migrator
              Sequel::TimestampMigrator.new(migrator.connection, migrations_path, {})
            end

            def migrations_path
              File.join(root_path, "db/migrate")
            end
          end
        end
      end
    end
  end
end
