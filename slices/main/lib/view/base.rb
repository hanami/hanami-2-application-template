# auto_register: false
# frozen_string_literal: true

require "app_prototype/view/base"

module Main
  module View
    class Base < AppPrototype::View::Base
      # This will eventually be automatic via Hanami 2 view integration
      config.part_namespace = Parts
    end
  end
end
