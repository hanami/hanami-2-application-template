# frozen_string_literal: true

require "shellwords"

require_relative "../../../application_command"
require_relative "../utils/database_config"

module Hanami
  module CLI
    module Commands
      module DB
        module Structure
          class Dump < ApplicationCommand
            desc "Dumps database structure to db/structure.sql file"

            def call(*)
              measure("#{database.name} structure dumped to db/structure.sql") do
                database.dump_command
              end
            end
          end
        end
      end
    end

    register "db structure dump", Commands::DB::Structure::Dump
  end
end
