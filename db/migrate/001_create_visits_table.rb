class CreateVisitsTable < ActiveRecord::Migration[5.1]
  class << self
    def up
      create_table :visits do |t|
        t.string 'evid'
        t.string 'vendor_site_id'
        t.string 'vendor_visit_id'
        t.string 'visit_ip'
        t.string 'vendor_visitor_id'

        t.timestamps
      end
    end

    def down
      drop_table :visits
    end
  end
end
