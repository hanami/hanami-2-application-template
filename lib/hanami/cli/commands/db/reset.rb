# frozen_string_literal: true

require_relative "../../application_command"
require_relative "create"
require_relative "drop"
require_relative "migrate"

module Hanami
  module CLI
    module Commands
      module DB
        class Reset < ApplicationCommand
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
