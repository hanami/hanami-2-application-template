# frozen_string_literal: true

require "rack/session/cookie"

Hanami.application.routes do
  use Rack::Session::Cookie,
    key: "app_prototype.session",
    secret: Hanami.application.settings.session_secret,
    expire_after: 60 * 60 * 24 * 365 # Expire after 1 year

  slice :main, at: "/" do
    root to: "home.show"
  end
end
