# frozen_string_literal: true

require "shellwords"

require_relative "../../application_command"
require_relative "utils/database_config"

module Hanami
  module CLI
    module Commands
      module DB
        class Drop < ApplicationCommand
          desc "Delete database"

          def call(**)
            if database.drop_command
              out.puts "=> database #{database.name} dropped"
            else
              out.puts "=> failed to drop #{database.name}"
            end
          end
        end
      end
    end
  end
end
