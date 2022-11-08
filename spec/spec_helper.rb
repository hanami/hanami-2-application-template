# frozen_string_literal: true

require "pathname"
SPEC_ROOT = Pathname(__dir__).realpath.freeze

require "hanami/prepare"

require_relative "support/rspec"
require_relative "support/web"
