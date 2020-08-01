# frozen_string_literal: true

require "app_prototype/types"

Hanami.application.settings do
  # Framework
  setting :log_to_stdout, AppPrototype::Types::Params::Bool.optional.default(false)

  # Database
  setting :database_url, AppPrototype::Types::String

  # Application
  setting :session_secret, AppPrototype::Types::String

  # Assets
  setting :precompiled_assets, AppPrototype::Types::Params::Bool.optional.default(false)
  setting :assets_server_url, AppPrototype::Types::String.optional.default("http://localhost:8080")
end
