# frozen_string_literal: true

require './app/mappers/visit_mapper'
require './app/services/visits_api_wrapper'
require './libs/http_rqrs'

class VisitsApiService
  def apply_rules
    visit_data
  end

  private

  attr_reader :visits_json

  def visit_data
    visits_json_response.body.collect do |value|
      visit = VisitMapper.new(input: value).visit_json_fields_to_visit_entity
      visit_repository.create_visit_with_page_views(visit)
    end
  end

  def visits_json_response
    visit_api_wrapper.visits
  end

  def visit_repository
    VisitRepository.new
  end

  def visit_api_wrapper
    VisitsApiWrapper.new(http_service: HttpRqrs.build(url: VISITS_API_URI))
  end
end
