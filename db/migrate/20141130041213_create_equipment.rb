class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :category_id, null: false
      t.string :name, null: false

      t.timestamps null: false

      t.index :category_id
    end

    add_foreign_key 'equipment', 'equipment_categories', column: 'category_id'
  end
end
