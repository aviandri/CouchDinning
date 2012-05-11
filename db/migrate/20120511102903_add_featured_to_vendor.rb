class AddFeaturedToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :featured, :boolean, :default => false
  end
end
