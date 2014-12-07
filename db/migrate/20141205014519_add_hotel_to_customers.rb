class AddHotelToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :hotel_name, :string
    add_column :customers, :room_number, :string
  end
end
