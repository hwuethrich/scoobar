class AddBoatToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :boat
    add_foreign_key 'events', 'boats'
  end
end
