# frozen_string_literal: true

require 'support/helpers/spec_helper'
require 'rspec'

RSpec.describe 'Visits API service' do
  describe 'GET on /visits' do
    it 'should return visits' do
      get '/visits'
      expect(last_response).to be_ok
      attributes = JSON.parse(last_response.body)
      first_attribute = attributes.first
      expect(attributes.count).to eq(4)
      expect(first_attribute.fetch('idSite')).to eq('209')
      expect(first_attribute.fetch('actionDetails').first.fetch('type')).to eq('action')
    end
  end
end
