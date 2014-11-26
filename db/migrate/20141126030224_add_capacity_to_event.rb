class AddCapacityToEvent < ActiveRecord::Migration
  def change
    add_column :events, :capacity, :integer
  end
end
