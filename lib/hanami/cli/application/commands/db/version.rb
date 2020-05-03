# frozen_string_literal: true

require "hanami/cli/application/command"
require_relative "structure/dump"
require_relative "utils/database"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          class Version < Command
            desc "Print schema version"

            option :target, desc: "Target migration number", aliases: ["-t"]

            def call(target: nil, **)
              migration = database.applied_migrations.last
              version = migration ? File.basename(migration, ".*") : "not available"

              out.puts "=> current schema version is #{version}"
            end

            private

            def database
              @database ||= Utils::Database.for_application(application)
            end
          end
        end

        register "db version", DB::Version
      end
    end
  end
end
