class AddEmailPhoneNumberToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :email, :string
    add_column :customers, :phone_number, :string
  end
end
