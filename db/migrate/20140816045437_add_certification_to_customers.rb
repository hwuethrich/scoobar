class AddCertificationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :certification_name,   :string
    add_column :customers, :certification_number, :string
    add_column :customers, :certification_date,   :date
    add_column :customers, :last_dive_on,         :date
    add_column :customers, :number_of_dives,      :integer
  end
end
