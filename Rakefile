# frozen_string_literal: true

require 'rubygems'
require 'active_record'
require 'yaml'

desc 'Load the environment'
task :environment do
  @env = ENV['RAILS_ENV'] || 'development'
  @databases = YAML.load_file('config/database.yml')
  ActiveRecord::Base.establish_connection(@databases[@env])
end

namespace :db do
  desc 'Create the database'
  task(create: :environment) do
    ActiveRecord::Base.logger = Logger.new($stdout)

    @charset = ENV.fetch('PG_DB_CHARSET', 'utf8')
    @collation = ENV.fetch('PG_DB_COLLATION', 'en_US.utf8')
    creation_options = { charset: @charset, collation: @collation }

    begin
      ActiveRecord::Base.establish_connection(@databases[@env].merge(database: nil))
      ActiveRecord::Base.connection.create_database(@databases[@env]['database'], creation_options)
      ActiveRecord::Base.establish_connection(@databases[@env])
    rescue StandardError => e
      warn(*e.backtrace)
      warn e.inspect
      warn '(if you set the charset manually, make sure you have a matching collation)'
    end
  end
end

namespace :db do
  desc 'Migrate the database'
  task(migrate: :environment) do
    ActiveRecord::Base.logger = Logger.new($stdout)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::MigrationContext.new('db/migrate/', ActiveRecord::SchemaMigration).migrate(nil)
  rescue StandardError => e
    warn(*e.backtrace)
    warn e.inspect
  end
end

namespace :db do
  desc 'Drops all the local databases defined in config/database.yml'
  task(drop: :environment) do
    ActiveRecord::Base.logger = Logger.new($stdout)
    ActiveRecord::Base.establish_connection(@databases[@env].merge('database' => 'postgres', 'schema_search_path' => 'public'))
    ActiveRecord::Base.connection.drop_database(@databases[@env]['database'])
  rescue StandardError => e
    warn(*e.backtrace)
    warn e.inspect
  end
end
