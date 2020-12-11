# frozen_string_literal: true

require './app/mappers/page_view_mapper'

require 'support/helpers/spec_helper'
require 'rspec'

RSpec.describe 'app/mappers/page_view_mapper.rb' do
  describe 'PageViewMapper, validates' do
    context 'It should returns a mapped PageView hash' do
      let(:page_view) do # TODO: PUT THIS JSON IN A JSON FILE
        page_view_json = JSON('
          {
            "type": "action",
            "url": "https:\/\/dummyurl.com",
            "pageTitle": "Information",
            "pageIdAction": "2728742",
            "serverTimePretty": "Sep 22, 2018 13:32:25",
            "pageId": "548141848",
            "generationTime": "0.48s",
            "timeSpent": "15",
            "timeSpentPretty": "15s",
            "icon": null,
            "timestamp": 1537623145
          }')
        PageViewMapper.new(input: page_view_json).page_view_json_fields_to_page_view_hash
      end

      it 'Json is mapped to PageView hash correctly' do
        expect(page_view[:url]).to eq("https:\/\/dummyurl.com")
        expect(page_view[:title]).to eq('Information')
        expect(page_view[:time_spent]).to eq('15')
        expect(page_view[:timestamp]).to eq(1537623145)
      end
    end
  end
end
