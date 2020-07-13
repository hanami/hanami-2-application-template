# frozen_string_literal: true

require "hanami/view"
require_relative "parts"

module Main
  module View
    class Base < Hanami::View
      # This will eventually be automatic via Hanami 2 view integration
      config.inflector = Hanami.application[:inflector]

      config.part_namespace = Parts
    end
  end
end
