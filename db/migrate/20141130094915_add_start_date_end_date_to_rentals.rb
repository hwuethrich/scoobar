class AddStartDateEndDateToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :start_time, :datetime, null: false
    add_column :rentals, :end_time, :datetime

    add_index :rentals, :start_time
    add_index :rentals, :end_time
  end
end
