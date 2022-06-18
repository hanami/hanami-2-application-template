# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Show < Main::Action
        def handle(*, res)
          res.body = "Welcome to AppPrototype"
        end
      end
    end
  end
end
