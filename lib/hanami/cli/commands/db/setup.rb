# frozen_string_literal: true

require "shellwords"

require_relative "../../application_command"
require_relative "utils/database_config"

module Hanami
  module CLI
    module Commands
      module DB
        class Setup < ApplicationCommand
          desc "Setup database"

          def call(**)
            run_command Create
            run_command Migrate
          end
        end
      end
    end
  end
end
