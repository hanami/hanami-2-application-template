# frozen_string_literal: true

module Hanami
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

              attr_reader :config
              attr_reader :root_path

              def initialize(config:, root_path:)
                @config = config
                @root_path = root_path
              end

              def url
                gateway.connection.url
              end

              def name
                url.split("/").last
              end

              def applied_migrations
                sequel_migrator.applied_migrations
              end

              def gateway
                config.gateways[:default]
              end

              def connection
                gateway.connection
              end

              def migrator
                @migrator ||= ROM::SQL::Migration::Migrator.new(
                  connection,
                  path: File.join(root_path, "db/migrate"),
                )
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
end
