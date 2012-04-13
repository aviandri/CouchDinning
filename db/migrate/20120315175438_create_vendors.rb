class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
