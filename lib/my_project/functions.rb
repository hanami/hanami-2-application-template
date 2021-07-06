# auto_register: false
# frozen_string_literal: true

require "dry/transformer"

module MyProject
  module Functions
    extend Dry::Transformer::Registry

    import Dry::Transformer::ArrayTransformations
    import Dry::Transformer::HashTransformations
  end
end
