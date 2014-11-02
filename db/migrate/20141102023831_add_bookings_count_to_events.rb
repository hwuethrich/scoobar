class AddBookingsCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :bookings_count, :integer, null: false, default: 0
  end
end
