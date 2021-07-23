# frozen_string_literal: true

require "app_prototype/types"
require "hanami/application/settings"

module AppPrototype
  class Settings < Hanami::Application::Settings
    # Framework
    setting :log_to_stdout, false, constructor: Types::Params::Bool.optional

    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, false, constructor: Types::Params::Bool.optional
    setting :assets_server_url, "http://localhost:8080", constructor: Types::String.optional
  end
end
