# frozen_string_literal: true

require './libs/http_rqrs'

require 'support/helpers/spec_helper'
require 'rspec'

RSpec.describe 'libs/http_rqrs.rb', vcr: true do
  describe 'HttpRqrs, validates' do
    let(:http_rqrs) do
      HttpRqrs.build(
        url: "#{ENV.fetch('VISITS_API_URI')}:3000"
      )
    end
    it 'Builds s connection to target service' do
      expect(http_rqrs.get('/visits').code).to eq('200')
    end
  end
end
