# frozen_string_literal: true

require "app_prototype/types"

Hanami.application.settings do
  Types = AppPrototype::Types

  # Database
  setting :database_url, Types::String

  # Assets
  setting :precompiled_assets, Types::Params::Bool.optional.default(false)
  setting :assets_server_url, Types::String.optional.default("http://localhost:8080")
end
