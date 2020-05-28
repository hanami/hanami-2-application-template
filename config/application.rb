# frozen_string_literal: true

require "hanami"

module AppPrototype
  class Application < Hanami::Application
    config.logger = {
      level: :debug,
      stream: settings.log_to_stdout ? $stdout : "log/#{Hanami.env}.log"
    }
  end
end
