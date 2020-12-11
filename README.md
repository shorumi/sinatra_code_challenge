# Visits Job Code Challenge

## Tech Stack
- Docker Compose
- Ruby 2.5.8
- MySQL
- Sinatra
- ActiveRecord
- Rake tasks
- VCR

## Starting the project
- Create a brand new `.env` file:
```shell
cp -a .env.development .env
```
- In a unix terminal tab run: 
```shell
docker-compose up --build
```
- In another terminal tab prepare the database with: 
```shell
docker-compose exec visit_statistic_service bundle exec rake db:create RUBY_ENV=development --trace
docker-compose exec visit_statistic_service bundle exec rake db:migrate RUBY_ENV=development --trace
```

## List all available Rake tasks
```shell
docker-compose exec visits_statistic_service bundle exec rake -T
```

## Running the app to populate the database with Visits and PageViews
```shell
docker-compose exec -e RUBY_ENV=development visit_statistic_service ruby -r './app.rb' -e 'call'
```

## Running the RSpec tests
- In a terminal tab run the rspec tests: 
```shell
docker-compose exec -e RUBY_ENV=test visit_statistic_service bundle exec rake db:create --trace
```
```shell
docker-compose exec -e RUBY_ENV=test visit_statistic_service bundle exec rake db:migrate --trace
```
```shell
docker-compose exec -e RUBY_ENV=test visit_statistic_service bundle exec rspec -fdoc
```
