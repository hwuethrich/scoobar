class CreateEventLogbooks < ActiveRecord::Migration
  def change
    create_table :event_logbooks do |t|
      t.references :event,     null: false, index: true, uniq: true
      t.datetime   :time_in,   null: false
      t.integer    :dive_time, null: false
      t.float      :max_depth, null: false
      t.text :comments

      t.timestamps null: false
    end
  end
end
