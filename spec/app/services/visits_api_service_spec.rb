# frozen_string_literal: true

require './app/services/visits_api_service'

require 'support/helpers/spec_helper'
require 'rspec'

RSpec.describe 'app/services/visits_api_service.rb' do
  describe 'VisitApiService, validates', vcr: true do
    context 'It should persists a Visit and its related PageView' do
      it do
        expect(VisitsApiService.new.apply_rules).to be_truthy
        expect(Visit.count).to eq(4)
        expect(Visit.first.page_views.count).to eq(11)
        expect(PageView.count).to eq(29)
      end
    end
  end
end
