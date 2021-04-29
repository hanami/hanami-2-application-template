# frozen_string_literal: true

<<<<<<< HEAD
require "shellwords"

require_relative "../../../application_command"
=======
require "hanami/cli/command"
require "shellwords"
>>>>>>> bae390b ([wip] start updating CLI)
require_relative "../utils/database_config"

module Hanami
  module CLI
    module Commands
      module DB
        module Structure
<<<<<<< HEAD
          class Dump < ApplicationCommand
            desc "Dumps database structure to db/structure.sql file"

            def call(*)
              measure("#{database.name} structure dumped to db/structure.sql") do
                database.dump_command
              end
            end
=======
          class Dump < Command
            desc "Dumps database structure to db/structure.sql file"

            def call(*)
              measure("#{database_config.db_name} structure dumped to db/structure.sql") do
                cmd = "pg_dump --schema-only --no-owner #{Shellwords.escape(database_config.db_name)} > #{output_file}"
                system(database_config.cli_env_vars, cmd)
              end
            end

            private

            def database_config
              @database_config ||= Utils::DatabaseConfig.for_application(application)
            end

            def output_file
              "#{application.root}/db/structure.sql"
            end
>>>>>>> bae390b ([wip] start updating CLI)
          end
        end
      end
    end

    register "db structure dump", Commands::DB::Structure::Dump
  end
end
