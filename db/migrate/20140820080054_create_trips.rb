class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string  :code, null: false
      t.string  :name, null: false
      t.integer :duration

      t.timestamps
    end
  end
end
