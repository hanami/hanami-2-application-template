# frozen_string_literal: true

require "my_project/types"
require "hanami/application/settings"

module MyProject
  class Settings < Hanami::Application::Settings
    # Framework
    setting :log_to_stdout, constructor: Types::Params::Bool.optional.default(false)

    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, constructor: Types::Params::Bool.optional.default(false)
    setting :assets_server_url, constructor: Types::String.optional.default("http://localhost:8080")
  end
end
