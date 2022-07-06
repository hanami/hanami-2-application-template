# frozen_string_literal: true

source "https://rubygems.org/"

# Application framework
gem "hanami", "~> 2.0.0.alpha", github: "hanami/hanami"
gem "hanami-cli", "~> 2.0.0.alpha"
gem "hanami-controller", "~> 2.0.0.alpha"
gem "hanami-router", "~> 2.0.0.alpha"
gem "hanami-utils", "~> 2.0.0.alpha"
gem "puma", "~> 5.6"
gem "rake", "~> 13.0"

# Temporary
gem "dry-files", github: "dry-rb/dry-files"
gem "dry-system", github: "dry-rb/dry-system", branch: "prefer-local-components-when-importing"
gem "dry-container", github: "dry-rb/dry-container", branch: "accept-block-with-merge"

# Application
gem "dry-types", "~> 1.0"
gem "dry-validation", "~> 1.4"
gem "i18n", "~> 1.8"

# Development/test
group :development, :test do
  gem "dotenv"
  gem "pry"
end

# Test
group :test do
  gem "capybara"
  gem "rspec"
end
