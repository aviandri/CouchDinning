class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :date
      t.float :total_price

      t.timestamps
    end
  end
end
