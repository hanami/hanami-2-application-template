require "hanami/cli"

module Hanami
  module CLI
    require_relative "commands/console"

    require_relative "commands/db/create"
    require_relative "commands/db/create_migration"
    require_relative "commands/db/drop"
    require_relative "commands/db/migrate"
    require_relative "commands/db/setup"
    require_relative "commands/db/reset"
    require_relative "commands/db/rollback"
    require_relative "commands/db/sample_data"
    require_relative "commands/db/seed"
    require_relative "commands/db/structure/dump"
    require_relative "commands/db/version"

    register "console", Commands::Console

    register "db create", Commands::DB::Create
    register "db create_migration", Commands::DB::CreateMigration
    register "db drop", Commands::DB::Drop
    register "db migrate", Commands::DB::Migrate
    register "db setup", Commands::DB::Setup
    register "db reset", Commands::DB::Reset
    register "db rollback", Commands::DB::Rollback
    register "db sample_data", Commands::DB::SampleData
    register "db seed", Commands::DB::Seed
    register "db structure dump", Commands::DB::Structure::Dump
    register "db version", Commands::DB::Version
  end
end
