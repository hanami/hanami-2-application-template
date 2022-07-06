# frozen_string_literal: true

require "app_prototype/types"

module AppPrototype
  class Settings < Hanami::Settings
    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, constructor: Types::Params::Bool, default: false
  end
end
