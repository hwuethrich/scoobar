class AddPriceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :price, :decimal, precision: 8, scale: 2
  end
end
