class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key 'events', 'trips'
  end
end
