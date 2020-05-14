# frozen_string_literal: true

source "https://rubygems.org/"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby "2.7.1"

# Application framework
gem "hanami", github: "hanami/hanami", branch: "unstable"
gem "hanami-controller", github: "hanami/controller", branch: "unstable"
gem "hanami-router", github: "hanami/router", branch: "unstable"
gem "hanami-utils", github: "hanami/utils", branch: "unstable"
gem "hanami-view", github: "hanami/view", branch: "master"
gem "puma", "~> 4.0"
gem "rake", "~> 13.0"

# Database
gem "pg", "~> 1.2"
gem "rom", "~> 5.2"
gem "rom-factory", "~> 0.10"
gem "rom-sql", "~> 3.2"
gem "sequel", "~> 5.32"
gem "sequel_pg", "~> 1.13"

# Application
gem "dry-matcher", "~> 0.8"
gem "dry-monads", "~> 1.2"
gem "dry-struct", "~> 1.0"
gem "dry-types", "~> 1.0"
gem "dry-validation", "~> 1.4"
gem "erbse", "~> 0.1"
gem "i18n", "~> 1.8"
gem "slim", "~> 4.0"

# Development/test
group :development, :test do
  gem "bundler-audit", "~> 0.6"
  gem "dotenv", "~> 2.7"
  gem "guard-rack", "~> 2.2"
  gem "pry-byebug", "~> 3.7"
  gem "standard"
end

# Test
group :test do
  gem "capybara", "~> 3.0"
  gem "capybara-screenshot", "~> 1.0"
  gem "cuprite", "~> 0.8"
  gem "database_cleaner", "~> 1.7"
  gem "puffing-billy", "~> 2.2"
  gem "rspec", "~> 3.9"
  gem "simplecov", "~> 0.17"
end
