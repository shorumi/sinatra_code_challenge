# frozen_string_literal: true

require './app/models/visit'
require './app/models/page_view'
require './app/services/visits_api_service'

require 'dotenv/load'

env_index = ARGV.index('-e')
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV['RUBY_ENV'] || 'development'
databases = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(databases[env])

VISITS_API_URI = "#{ENV.fetch('VISITS_API_URI')}:3000"

def call
  pp('******* Starting the proccess *******')

  VisitsApiService.new.apply_rules

  pp('******* Finishing the proccess *******')

end
