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
        class Version < ApplicationCommand
=======
        class Version < Command
>>>>>>> bae390b ([wip] start updating CLI)
          desc "Print schema version"

          option :target, desc: "Target migration number", aliases: ["-t"]

          def call(target: nil, **)
            migration = database.applied_migrations.last
            version = migration ? File.basename(migration, ".*") : "not available"

            out.puts "=> current schema version is #{version}"
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
