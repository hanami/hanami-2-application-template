# frozen_string_literal: true
require "rom/sql/rake_task"

load "spec/support/tasks.rake"

Rake.add_rakelib "lib/tasks"

task :environment do
  require "hanami/init"
end

namespace :db do
  task :setup do
    require "hanami/init" # TODO: We should be able to just `.container.start(:persistence)`?
    ROM::SQL::RakeSupport.env = Hanami.application.container["persistence.rom"]
  end
end
