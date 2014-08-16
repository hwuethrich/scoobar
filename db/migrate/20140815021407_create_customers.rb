class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string   :first_name,    null: false
      t.string   :last_name,     null: false
      t.date     :date_of_birth, null: false
      t.integer  :gender,        null: false

      t.timestamps
    end
  end
end
