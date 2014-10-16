class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :event,    null: false, index: true
      t.references :customer, null: false, index: true

      t.foreign_key :events
      t.foreign_key :customers

      t.timestamps

      t.index [:event_id, :customer_id], unique: true
    end
  end
end
