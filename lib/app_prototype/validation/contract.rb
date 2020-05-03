# auto_register: false
# frozen_string_literal: true

require "dry/validation"
require "dry/schema/messages/i18n"

module AppPrototype
  module Validation
    class Contract < Dry::Validation::Contract
      config.messages.backend = :i18n
      config.messages.top_namespace = "validation"
    end
  end
end
