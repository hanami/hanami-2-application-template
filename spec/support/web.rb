# frozen_string_literal: true

require "capybara/rspec"

Capybara.app = Hanami.rack_app
Capybara.server = :puma, {Silent: true}
