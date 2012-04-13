class AddAvatarToVendor < ActiveRecord::Migration
  def change
    remove_column :vendors, :avatar
    change_table :vendors do |t|
      t.has_attached_file :avatar
    end
  end
end
