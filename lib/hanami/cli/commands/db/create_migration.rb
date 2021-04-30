require_relative "../../application_command"
require_relative "structure/dump"
require_relative "utils/database"

module Hanami
  module CLI
    module Commands
      module DB
        class CreateMigration < ApplicationCommand
          desc "Create new migration file"

          argument :name, desc: "Migration file name"

          def call(name:, **)
            migrator = database.migrator
            version = migrator.generate_version

            measure "migration #{version}_#{name} created" do
              migrator.create_file(name, version)
            end
          end
        end
      end
    end
  end
end
