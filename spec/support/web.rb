# frozen_string_literal: true

require "capybara/rspec"

Capybara.app = Hanami.app
Capybara.server = :puma, {Silent: true}
