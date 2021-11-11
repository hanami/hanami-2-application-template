# frozen_string_literal: true

require "app_prototype/types"
require "hanami/application/settings"

module AppPrototype
  class Settings < Hanami::Application::Settings
    # Framework
    setting :log_to_stdout, constructor: Types::Params::Bool, default: false

    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, constructor: Types::Params::Bool, default: false
  end
end
