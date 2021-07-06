# auto_register: false
# frozen_string_literal: true

require "json" # required for Hanami::Action::Flash to work
require "hanami/action"
require "hanami/action/cookies"
require "hanami/action/csrf_protection"
require "hanami/action/session"

module MyProject
  class Action < Hanami::Action
    def self.inherited(klass)
      super

      # These will need to be sorted by the framework eventually
      klass.include Hanami::Action::Cookies
      klass.include Hanami::Action::Session
      klass.include Hanami::Action::CsrfProtection
    end
  end
end
