class CreatePageViewsTable < ActiveRecord::Migration[5.1]
  class << self
    def up
      create_table :page_views do |t|
        t.string 'title'
        t.string 'position'
        t.text 'url'
        t.string 'time_spent'
        t.decimal 'timestamp', precision: 14, scale: 3
        t.belongs_to :visit

        t.timestamps
      end
    end

    def down
      drop_table :visits
    end
  end
end
