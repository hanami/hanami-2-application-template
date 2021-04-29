# frozen_string_literal: true

<<<<<<< HEAD
require "shellwords"

require_relative "../../application_command"
=======
require "hanami/cli/command"
require "shellwords"
>>>>>>> bae390b ([wip] start updating CLI)
require_relative "utils/database_config"

module Hanami
  module CLI
    module Commands
      module DB
<<<<<<< HEAD
        class Drop < ApplicationCommand
          desc "Delete database"

          def call(**)
            if database.drop_command
              out.puts "=> database #{database.name} dropped"
            else
              out.puts "=> failed to drop #{database.name}"
            end
=======
        class Drop < Command
          desc "Delete database"

          def call(**)
            db_name = database_config.db_name

            system(database_config.cli_env_vars, "dropdb #{Shellwords.escape(db_name)}")
            out.puts "=> database #{db_name} dropped" if $?.success?
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
