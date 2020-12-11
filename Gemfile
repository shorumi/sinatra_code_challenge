# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# A modern, simple and very fast MySQL library for Ruby - binding to libmysql
gem 'pg'
#Active Record connects classes to relational database tables to establish an almost zero-configuration persistence layer
gem 'activerecord'

# Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort
gem 'sinatra', '~> 2.1.0'
# A Ruby Web Server Built For Concurrency
gem 'puma'

group :development do
  # For every future Sinatra release, have at least one fully compatible release
  gem 'sinatra-contrib'
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem 'pry'
  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'pry-byebug'
  # Rake is a Make-like program implemented in Ruby. Tasks and dependencies are specified in standard Ruby syntax.
  gem 'rake'
end

group :test do
  # Behaviour Driven Development for Ruby
  gem 'rspec'
  # Rack::Test is a small, simple testing API for Rack apps
  gem 'rack-test'
  # VCR records HTTP K7
  gem 'vcr'
  gem 'webmock'
end


group :development, :test do
  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
  gem 'rubocop'
end

