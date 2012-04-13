class AddManyToManyOnOrderAndItem < ActiveRecord::Migration
  def change
    add_column :order_items, :order_id, :long
    add_column :order_items, :item_id, :long
  end
end
