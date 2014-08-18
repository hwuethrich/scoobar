class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name
      t.datetime :start_time, null: false
      t.datetime :end_time,   null: false
      t.text     :description

      t.timestamps

      t.index :start_time
      t.index :end_time
    end
  end
end
