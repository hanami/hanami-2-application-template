<<<<<<< HEAD
# frozen_string_literal: true

require_relative "../../application_command"
=======
require "hanami/cli/command"
require "shellwords"
require_relative "utils/database_config"
>>>>>>> bae390b ([wip] start updating CLI)

module Hanami
  module CLI
    module Commands
      module DB
<<<<<<< HEAD
        class Create < ApplicationCommand
          desc "Create database"

          def call(**)
            if database.create_command
              out.puts "=> database #{database.name} created"
            else
              out.puts "=> failed to create database #{database.name}"
            end
=======
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
>>>>>>> bae390b ([wip] start updating CLI)
          end
        end
      end
    end
  end
end
