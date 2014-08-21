class AddColorToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :color, :string
  end
end
