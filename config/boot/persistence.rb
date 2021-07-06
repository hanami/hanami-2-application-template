Hanami.application.register_bootable :persistence, namespace: true do |container|
  init do
    require "rom-changeset"
    require "rom/core"
    require "rom/sql"

    rom_config = ROM::Configuration.new(:sql, container[:settings].database_url)

    rom_config.plugin(:sql, relations: :instrumentation) do |plugin_config|
      plugin_config.notifications = notifications
    end

    rom_config.plugin(:sql, relations: :auto_restrictions)

    register "config", rom_config
    register "db", rom_config.gateways[:default].connection
  end

  start do
    config = container["persistence.config"]
    config.auto_registration container.root.join("lib/my_project/persistence")

    register "rom", ROM.container(config)
  end
end
