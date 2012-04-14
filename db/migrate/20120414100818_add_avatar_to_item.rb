class AddAvatarToItem < ActiveRecord::Migration
  def change
    remove_column :items, :avatar
    change_table :items do |t|
      t.has_attached_file :avatar
    end
  end
end
