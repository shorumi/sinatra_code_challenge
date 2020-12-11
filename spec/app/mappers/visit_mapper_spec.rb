# frozen_string_literal: true

require './app/mappers/visit_mapper'

require 'support/helpers/spec_helper'
require 'rspec'

RSpec.describe 'app/mappers/visit_mapper.rb' do
  describe 'VisitMapper, validates' do
    context 'It should create a Visit and its related PageView' do
      let(:visit_with_page_view) do # TODO: PUT THIS JSON IN A JSON FILE
        visits_json_file = File.read('./spec/support/fixtures/visits.json')
        visit_with_page_view_json = JSON(visits_json_file)
        VisitMapper.new(input: visit_with_page_view_json).visit_json_fields_to_visit_entity
      end

      it 'Visit with its PageView is populated correctly' do
        expect(visit_with_page_view.id).to eq(nil)
        expect(visit_with_page_view.evid).to eq('966634dc-0bf6-1ff7-f4b6-08000c95c670')
        expect(visit_with_page_view.vendor_site_id).to eq('209')
        expect(visit_with_page_view.vendor_visit_id).to eq('134853732')
        expect(visit_with_page_view.visit_ip).to eq('24.6.5.33')
        expect(visit_with_page_view.vendor_visitor_id).to eq('e280af5191b64f18')
        expect(visit_with_page_view.page_views.first).to be_an_instance_of(PageView)
      end
    end
  end
end
