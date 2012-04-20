class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :name
      t.text :building_type
      t.integer :phone_number
      t.text :additional_detail

      t.timestamps
    end
  end
end
