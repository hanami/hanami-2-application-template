# frozen_string_literal: true
require "rom/sql/rake_task"

load "spec/support/tasks.rake"

Rake.add_rakelib "lib/tasks"

task :environment do
  require "hanami/init"
end

namespace :db do
 task :setup do
   require "hanami/init" # TODO: Switch this to just boot what we need
   ROM::SQL::RakeSupport.env = Hanami.application.container["persistence.rom"]
 end
end
