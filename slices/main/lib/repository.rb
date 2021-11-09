# auto_register: false
# frozen_string_literal: true

require "app_prototype/repository"

module Main
  class Repository < AppPrototype::Repository
    struct_namespace Entities
  end
end
