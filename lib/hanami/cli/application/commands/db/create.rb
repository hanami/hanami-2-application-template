require "hanami/cli/application/command"
require "shellwords"
require_relative "utils/database_config"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          class Create < Command
            desc "Create database"

            def call(**)
              db_name = database_config.db_name

              system(database_config.cli_env_vars, "createdb #{Shellwords.escape(db_name)}")
              out.puts "=> database #{db_name} created" if $?.success?
            end

            private

            def database_config
              @database_config ||= Utils::DatabaseConfig.for_application(application)
            end
          end
        end

        register "db create", DB::Create
      end
    end
  end
end
