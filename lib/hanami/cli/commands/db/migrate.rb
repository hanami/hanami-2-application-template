# frozen_string_literal: true

<<<<<<< HEAD
require_relative "../../application_command"
=======
require "hanami/cli/command"
>>>>>>> bae390b ([wip] start updating CLI)
require_relative "structure/dump"
require_relative "utils/database"

module Hanami
  module CLI
    module Commands
      module DB
<<<<<<< HEAD
        class Migrate < ApplicationCommand
=======
        class Migrate < Command
>>>>>>> bae390b ([wip] start updating CLI)
          desc "Migrates database"

          option :target, desc: "Target migration number", aliases: ["-t"]

          def call(target: nil, **)
<<<<<<< HEAD
            return true if Dir[File.join(application.root, "db/migrate/*.rb")].empty?
=======
            return if Dir[File.join(application.root, "db/migrate/*.rb")].empty?
>>>>>>> bae390b ([wip] start updating CLI)

            measure "database #{database.name} migrated" do
              if target
                run_migrations(target: Integer(target))
              else
                run_migrations
              end
<<<<<<< HEAD

              true
=======
>>>>>>> bae390b ([wip] start updating CLI)
            end
          end

          private

          def run_migrations(**options)
<<<<<<< HEAD
            database.run_migrations(**options)
=======
            ROM::SQL.with_gateway(database.gateway) do
              database.migrator.run(options)
            end
          end

          def database
            @database ||= Utils::Database.for_application(application)
>>>>>>> bae390b ([wip] start updating CLI)
          end
        end
      end
    end
  end
end

