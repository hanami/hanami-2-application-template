# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Show < Action::Base
        def handle(_req, res)
          res.body = "Welcome to AppPrototype"
        end
      end
    end
  end
end
