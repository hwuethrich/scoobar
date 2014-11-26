class AddNightdiveToEvent < ActiveRecord::Migration
  def change
    add_column :events, :night_dive, :boolean, default: false, null: false
  end
end
