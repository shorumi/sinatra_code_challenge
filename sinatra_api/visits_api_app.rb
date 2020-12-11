# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/reloader'

class VisitsApiApp < Sinatra::Base
  set :server, :puma

  configure :development do
    register Sinatra::Reloader
  end

  def initialize(resource_input:)
    super
    @resource_input = resource_input
  end

  get '/visits' do
    content_type :json

    if File.exist?(resource_input)
      File.read(resource_input)
    else
      error 404, { error: 'There is no JSON sample file' }.to_json
    end
  end

  private

  attr_reader :resource_input
end
