# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

# rails-controller-testing provides ActionController::TestCase-like methods for ActionDispatch::IntegrationTest
gem 'rails-controller-testing'

# simplecov is a code coverage analysis tool for Ruby
gem "simplecov", require: false, group: :test

# shoulda-matchers provides RSpec-compatible one-liners to test common Rails functionality
gem "shoulda-matchers", group: :test

# faker generates fake data for you
gem "faker", groups: %i[development test]

# factory_bot_rails is a fixtures replacement with a more straightforward syntax
gem "factory_bot_rails", groups: %i[development test]

# rspec-rails is a testing framework for Rails
gem "rspec-rails", "~> 6.1.0", groups: %i[development test]

# devise is a popular authentication library for Rails
gem "devise"

# inconsistencies and inefficiencies between a database schema and application models
gem "database_consistency", groups: [:development, :test]

# Brakeman analyzes our code for security vulnerabilities
gem "brakeman"

# bundler-audit checks our dependencies for vulnerabilities
gem "bundler-audit"

# RuboCop checks our code for style violations
gem "rubocop", group: :development
gem "rubocop-rails", group: :development
gem "rubocop-rspec", group: :development
gem "rubocop-performance", group: :development

# dotenv is used to load environment variables from a .env file into ENV
gem "dotenv-rails", groups: %i[development test]

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
