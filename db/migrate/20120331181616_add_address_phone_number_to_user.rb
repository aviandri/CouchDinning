class AddAddressPhoneNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :building_detail, :text
    add_column :users, :phone_number, :integer
    add_column :users, :building_type, :text
  end
end
