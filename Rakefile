# frozen_string_literal: true

load "spec/support/tasks.rake"

Rake.add_rakelib "lib/tasks"

task :environment do
  require "hanami/init"

  Hanami.application.start_bootable :bugsnag
  load "bugsnag/tasks/bugsnag.rake"
end
