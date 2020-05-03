# frozen_string_literal: true

require "hanami/cli/application/command"
require "shellwords"
require_relative "../utils/database_config"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          module Structure
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
            end
          end
        end

        register "db structure dump", DB::Structure::Dump
      end
    end
  end
end
