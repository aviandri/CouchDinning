class OrderService
  class << self
  
    def create(user, items_json)
      if !user || !items_json
        raise CustomException::InternalServerError
      end
      items = []
      total_price = 0
      items_json.each{|item|
        i = Item.find(item[:item_id].to_i)
        q = item[:quantity].to_i
        q.times {
          items << i
          total_price += i.price
        }
      }
      order_param = {:items => items, :total_price => total_price, :user_id => user.id, :status => 1}
      @order = Order.create(order_param)
    end
    
    def checkout(order_ids)
      if !order_ids
        raise CustomException::InternalServerError
      end
      
      Order.transaction do
        order_ids.each{|id|
          order = Order.find(id)
          order.status = Order::STATUS_PROCESSED  
          order.save
        }
      end
    end
  end
end