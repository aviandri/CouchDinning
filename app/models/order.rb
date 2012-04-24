class Order < ActiveRecord::Base
  belongs_to  :vendor
  has_many    :order_items
  has_many    :items, :through => :order_items
  
  def create(params, item_ids)
    p = params[:order]
    item_ids = params[:item_ids]
    if item_ids
      item_ids = @item_ids.split(",")
      items = []
      item_ids.each do |id|
        item = Item.find(id)
      end
      p["items"] = items
    end
    @order = Order.create(p)
  end
end
