class AddTripToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :trip, index: true
  end
end
