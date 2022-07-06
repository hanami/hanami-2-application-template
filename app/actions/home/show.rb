# frozen_string_literal: true

module AppPrototype
  module Actions
    module Home
      class Show < AppPrototype::Action
        def handle(*, res)
          res.body = "Welcome to AppPrototype"
        end
      end
    end
  end
end
