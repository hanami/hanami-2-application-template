# frozen_string_literal: true

source "https://rubygems.org/"

# Core gems
gem "rake", "~> 13.0"

# Application framework
%w[hanami hanami-cli hanami-controller hanami-router hanami-utils hanami-view].each do |name|
  gem name, "~> 2.0.0.alpha"
end

# HTTP
gem "puma", "~> 4.0"
gem "down", "~> 5.1"

# Database
gem "sqlite3"
gem "rom", "~> 5.2"
gem "rom-factory", "~> 0.10"
gem "rom-sql", "~> 3.2"
gem "sequel", "~> 5.32"

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
  gem "pry-byebug"
  gem "break", "~> 0.21"
  gem "dotenv", "~> 2.7"
  gem "guard-rack", "~> 2.2"
  gem "pry"
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
