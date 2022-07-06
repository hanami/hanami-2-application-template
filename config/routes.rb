# frozen_string_literal: true

module AppPrototype
  class Routes < Hanami::Routes
    define do
      root to: "home.show"
    end
  end
end
