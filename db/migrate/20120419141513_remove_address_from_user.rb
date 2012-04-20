class RemoveAddressFromUser < ActiveRecord::Migration  
  def change
    remove_column :users, :building_detail
    remove_column :users, :phone_number
    remove_column :users, :building_type
  end
end
