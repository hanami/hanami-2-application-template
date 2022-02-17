# frozen_string_literal: true

require "hanami/view"

module AppPrototype
  module View
    class Base < Hanami::View
      # This will eventually be automatic via Hanami 2 view integration
      config.inflector = Hanami.application[:inflector]
    end
  end
end
