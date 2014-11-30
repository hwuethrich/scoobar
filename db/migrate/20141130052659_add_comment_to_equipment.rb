class AddCommentToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :comment, :text
  end
end
