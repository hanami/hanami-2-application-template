# auto_register: false
# frozen_string_literal: true

require "hanami/view"

module Main
  class View < Hanami::View
    # This will eventually be automatic via Hanami 2 view integration
    config.inflector = Hanami.application[:inflector]
    config.part_namespace = Parts
  end
end
