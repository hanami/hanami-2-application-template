# frozen_string_literal: true

ENV["HANAMI_ENV"] = "test"

require_relative "../config/application"
Hanami.init

require_relative "support/rspec"
require_relative "support/suite"
Dir[File.join(__dir__, "support", "**", "global_config.rb")].each(&method(:require))

SPEC_ROOT = Pathname(__dir__).realpath.freeze
FIXTURES_PATH = SPEC_ROOT.join("fixtures").freeze

suite = Test::Suite.instance
suite.start_coverage
