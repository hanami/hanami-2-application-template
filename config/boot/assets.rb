# frozen_string_literal: true

Hanami.application.register_bootable :assets do |container|
  init do
    require "framework/web/assets"
  end

  start do
    assets = Framework::Web::Assets.new(
      root: Hanami.application.root,
      precompiled: Hanami.env == :production || container[:settings].precompiled_assets,
      server_url: Hanami.application.configuration.assets.server_url
    )

    register "assets", assets
  end
end
