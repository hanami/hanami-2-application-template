# frozen_string_literal: true

# auto_register: false

require "json" # required for Hanami::Action::Flash to work
require "hanami/action"
require "hanami/action/cookies"
require "hanami/action/csrf_protection"
require "hanami/action/session"
require "hanami/controller/configuration"

module AppPrototype
  class Action < Hanami::Action
    def self.inherited(klass)
      super

      # It would be nice if these could just be included on the top class,
      # rather than on subclasses via this inherited hook
      klass.include Hanami::Action::Cookies
      klass.include Hanami::Action::Session
      klass.include Hanami::Action::CSRFProtection
    end

    # FIXME: make this more easily configurable at the application level
    DEFAULT_CONFIGURATION = Hanami::Controller::Configuration.new { |config|
      config.default_request_format = :html
    }
    def self.new(configuration: DEFAULT_CONFIGURATION, **args)
      super(configuration: configuration, **args)
    end

    include Deps[view_context: "view.context"]

    private

    def render(req, res, view = renderable_view, **args)
      res.body = view.call(context: view_context.with(**view_context_options(req, res)), **args)
      res
    end

    def renderable_view
      view
    end

    def view_context_options(req, res)
      {request: req, response: res}
    end
  end
end
