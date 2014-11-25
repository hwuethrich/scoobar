class AddNightdiveToEvent < ActiveRecord::Migration
  def change
    add_column :events, :nightdive, :boolean, default: false, null: false
  end
end
