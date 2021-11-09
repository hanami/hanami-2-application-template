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

    config.logger.options[:level] = :debug
    config.logger.options[:stream] = settings.log_to_stdout ? $stdout : "log/#{Hanami.env}.log"

    config.actions.default_headers['Content-Security-Policy'] = \
      "base-uri 'self'; " \
      "child-src 'self'; " \
      "connect-src 'self'; " \
      "default-src 'none'; " \
      "font-src 'self'; " \
      "form-action 'self'; " \
      "frame-ancestors 'self'; " \
      "frame-src 'self'; " \
      "img-src 'self' https: data:; " \
      "media-src 'self'; " \
      "object-src 'none'; " \
      "script-src 'self' #{settings.assets_server_url}; " \
      "style-src 'self' 'unsafe-inline' https: #{settings.assets_server_url}"
  end
end
