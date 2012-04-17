class AddDashboardImageToVendor < ActiveRecord::Migration
  def change
    remove_column :vendors, :avatar_file_name
    remove_column :vendors, :avatar_content_type
    remove_column :vendors, :avatar_file_size
    remove_column :vendors, :avatar_updated_at
    change_table :vendors do |t|
      t.has_attached_file :logo_image
      t.has_attached_file :dashboard_image
    end
  end
end
