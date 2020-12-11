# frozen_string_literal: true

require_relative 'application_record'

class Visit < ApplicationRecord
  has_many :page_views, dependent: :delete_all
end
