class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :event,    null: false, index: true
      t.references :customer, null: false, index: true

      t.timestamps

      t.index [:event_id, :customer_id], unique: true
    end

    add_foreign_key 'bookings', 'events'
    add_foreign_key 'bookings', 'customers'
  end
end
