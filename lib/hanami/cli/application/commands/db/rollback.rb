# frozen_string_literal: true

require "hanami/cli/application/command"
require_relative "structure/dump"
require_relative "utils/database"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          class Rollback < Command
            desc "Rollback database to a previous migration"

            option :target, desc: "Target migration number", aliases: ["-t"]

            def call(target: nil, **)
              migration_code, migration_name = find_migration(target)

              measure "database #{database.name} rolled back to #{migration_name}" do
                database.gateway.run_migrations(target: Integer(migration_code))
              end

              run_command Structure::Dump
            end

            private

            def database
              @database ||= Utils::Database.for_application(application)
            end

            def find_migration(code)
              migration = database.applied_migrations.yield_self { |migrations|
                if code
                  migrations.detect { |m| m.split("_").first == code }
                else
                  migrations.last
                end
              }

              migration_code = code || migration.split("_").first
              migration_name = File.basename(migration, ".*")

              [migration_code, migration_name]
            end
          end
        end

        register "db rollback", Commands::DB::Rollback
      end
    end
  end
end
