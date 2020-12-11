# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
ENV['APP_ENV'] = 'test'
ENV['RUBY_ENV'] = 'test'

require_relative File.join('../../../', 'sinatra_api', 'visits_api_app')
require 'rack/test'
require 'vcr'
require 'webmock'

require './app/models/visit'
require './app/models/page_view'

env_index = ARGV.index('-e')
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV['RUBY_ENV'] || 'test'
databases = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(databases[env])

VISITS_API_URI = "#{ENV.fetch('VISITS_API_URI')}:3000"

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = false

  # Run each test inside a DB transaction
  config.around(:each) do |test|
    ActiveRecord::Base.transaction do
      test.run
      raise ActiveRecord::Rollback
    end
  end

  config.order = 'random'

  include Rack::Test::Methods

  def app
    VisitsApiApp.new(resource_input: 'sinatra_api/samples/api_response.json')
  end

  # This Setup will:
  # Record VCR's tapes on spec/support/cassettes
  # Record just new episodes
  VCR.configure do |c|
    c.hook_into :webmock
    c.cassette_library_dir = 'spec/support/cassettes'
    c.configure_rspec_metadata!
    # c.default_cassette_options = { record: :new_episodes }
    c.default_cassette_options = { re_record_interval: 3600 * 24 }
  end
end
