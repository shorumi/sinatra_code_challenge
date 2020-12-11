# frozen_string_literal: true

class VisitsApiWrapper
  def initialize(http_service:)
    @http_service = http_service
  end

  def visits
    http_service.get('/visits')
  end

  private

  attr_reader :http_service
end
