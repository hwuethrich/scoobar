class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :customer, null: false
      t.references :equipment, null: false

      t.timestamps null: false

      t.index :customer_id
      t.index :equipment_id
    end

    add_foreign_key 'rentals', 'customers'
    add_foreign_key 'rentals', 'equipment'
  end
end
