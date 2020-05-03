# frozen_string_literal: true

require "app_prototype/repository"
require_relative "entities"

module Main
  class Repository < AppPrototype::Repository
    struct_namespace Entities
  end
end
