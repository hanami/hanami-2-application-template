# frozen_string_literal: true

require "hanami/view"

module AppPrototype
  class View < Hanami::View
    def self.inherited(klass)
      super

      klass.class_eval do
        # This will eventually be automatic via Hanami 2 view integration
        config.inflector = Hanami.application[:inflector]
        config.part_namespace = Parts
      end
    end
  end
end
