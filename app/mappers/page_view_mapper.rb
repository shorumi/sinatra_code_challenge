# frozen_string_literal: true

class PageViewMapper
  def initialize(input:)
    @page_view = input
  end

  def page_view_json_fields_to_page_view_hash
    page_view_hash
  end

  private

  attr_reader :page_view

  def page_view_hash
    {
      url: page_view.fetch('url', nil),
      title: page_view.fetch('pageTitle', nil),
      time_spent: page_view.fetch('timeSpent', nil),
      timestamp: page_view.fetch('timestamp', nil)
    }
  end
end
