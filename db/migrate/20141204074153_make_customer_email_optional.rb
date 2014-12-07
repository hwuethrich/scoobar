class MakeCustomerEmailOptional < ActiveRecord::Migration
  def change
    change_column :customers, :email, :string, null: true
  end
end
