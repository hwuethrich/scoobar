class AddGuideToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :guide, index: true
    add_foreign_key :events, :guides

    remove_foreign_key :events, :trips
  end
end
