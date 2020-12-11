# frozen_string_literal: true

require './sinatra_api/visits_api_app'

run VisitsApiApp.new(resource_input: './sinatra_api/samples/api_response.json')
