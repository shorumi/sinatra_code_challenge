require './app/repositories/visit_repository'
require './app/mappers/page_view_mapper'

class VisitMapper
  EVID_RGX = /\A[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/.freeze

  def initialize(input:)
    @visits = input
  end

  def visit_json_fields_to_visit_entity
    build_visits_with_page_views
  end

  private

  attr_reader :visits

  def visit_hash
    sanitized_evid = sanitize_evid
    {
      evid: sanitized_evid,
      vendor_site_id: visits.fetch('idSite'),
      vendor_visit_id: visits.fetch('idVisit'),
      visit_ip: visits.fetch('visitIp'),
      vendor_visitor_id: visits.fetch('visitorId')
    }
  end

  # TODO: Extract to a validation layer and use dry-validation gem to validate it.
  def sanitize_evid
    visits.fetch('referrerName').gsub!('evid_', '')
    visits['referrerName'] = visits.fetch('referrerName') !~ EVID_RGX ? 'incorrect-evid' : visits.fetch('referrerName')
  end

  def visit
    Visit.new(visit_hash)
  end

  def map_page_view(unmapped_page_view)
    PageViewMapper.new(input: unmapped_page_view).page_view_json_fields_to_page_view_hash
  end

  def build_visits_with_page_views
    visit_entity ||= visit

    visits.fetch('actionDetails').each do |item|
      visit_entity.page_views.build(map_page_view(item)) # TODO: Refactor visit_entity.page_views to avoid LOD
    end

    visit_entity
  end
end
