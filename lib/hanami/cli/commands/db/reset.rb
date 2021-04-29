# frozen_string_literal: true

<<<<<<< HEAD
require_relative "../../application_command"
=======
require "hanami/cli/command"
>>>>>>> bae390b ([wip] start updating CLI)
require_relative "create"
require_relative "drop"
require_relative "migrate"

module Hanami
  module CLI
    module Commands
      module DB
<<<<<<< HEAD
        class Reset < ApplicationCommand
=======
        class Reset < Command
>>>>>>> bae390b ([wip] start updating CLI)
          desc "Drop, create, and migrate database"

          def call(**)
            run_command Drop
            run_command Create
            run_command Migrate
          end
        end
      end
    end
  end
end
