# frozen_string_literal: true

require "my_project/repository"
require_relative "entities"

module Main
  class Repository < MyProject::Repository
    struct_namespace Entities
  end
end
