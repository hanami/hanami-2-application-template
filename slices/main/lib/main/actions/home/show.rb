# frozen_string_literal: true

require "main/action"

module Main
  module Actions
    module Home
      class Show < Main::Action
        include Deps[view: "views.home.show"]

        def handle(req, res)
          res.render view
        end
      end
    end
  end
end
