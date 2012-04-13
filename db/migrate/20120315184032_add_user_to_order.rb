class AddUserToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :long
  end
end
