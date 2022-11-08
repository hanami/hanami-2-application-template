# frozen_string_literal: true

require "hanami"

module AppPrototype
  class App < Hanami::App
    config.actions.sessions = [:cookie,
      key: "app_prototype.session",
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365 # 1 year
    ]
  end
end
