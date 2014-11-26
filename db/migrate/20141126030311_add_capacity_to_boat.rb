class AddCapacityToBoat < ActiveRecord::Migration
  def change
    add_column :boats, :capacity, :integer
  end
end
