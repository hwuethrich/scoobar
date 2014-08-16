class AddAddressToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address1,  :string
    add_column :customers, :address2,  :string
    add_column :customers, :city,      :string
    add_column :customers, :state,     :string
    add_column :customers, :country,   :string
    add_column :customers, :post_code, :integer
  end
end
