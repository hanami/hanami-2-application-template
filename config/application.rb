# frozen_string_literal: true

begin
  require "break"
rescue LoadError => e
  raise unless e.path == "break"
end

require "hanami"

module AppPrototype
  class Application < Hanami::Application
    config.sessions = :cookie, {
      key: "app_prototype.session",
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365 # 1 year
    }
  end
end
