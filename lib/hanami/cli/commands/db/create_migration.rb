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
        class CreateMigration < ApplicationCommand
=======
        class CreateMigration < Command
>>>>>>> bae390b ([wip] start updating CLI)
          desc "Create new migration file"

          argument :name, desc: "Migration file name"

          def call(name:, **)
            migrator = database.migrator
            version = migrator.generate_version

            measure "migration #{version}_#{name} created" do
              migrator.create_file(name, version)
            end
          end
<<<<<<< HEAD
=======

          private

          def database
            @database ||= Utils::Database.for_application(application)
          end
>>>>>>> bae390b ([wip] start updating CLI)
        end
      end
    end
  end
end
