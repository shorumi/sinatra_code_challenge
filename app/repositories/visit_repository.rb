# frozen_string_literal: true

class VisitRepository
  def create_visit_with_page_views(visit)
    visit.save!
  end
end
