class OrderService
  class << self
    # def create(user, item_ids)
    #      if !user || !item_ids
    #        raise CustomException::InternalServerError
    #      end
    #      item_ids = item_ids.uniq
    #      #make sure item in an order comes from the same vendor
    #      items = []
    #      first_item = Item.find(item_ids.shift)
    #      items << first_item
    #      total_price = 0
    #      item_ids.each do |id|
    #        i = Item.find(id)
    #        if i.vendor_id != first_item.vendor_id
    #          raise CustomException::DifferentVendorOrder
    #        end
    #        items << i
    #        total_price += i.price
    #      end
    #      order_param = {:items => items, :total_price => total_price, :user_id => user.id}
    #      @order = Order.create(order_param)
    #    end
    
    def create(user, items_json)
      items = []
      total_price = 0
      vendor_id = nil
      items_json.each{|item|
        i = Item.find(item[:item_id].to_i)
        vendor_id = vendor_id ? vendor_id : i.vendor_id
        if vendor_id != i.vendor_id
          raise CustomException::DifferentVendorOrder
        end
        q = item[:quantity].to_i
        q.times {
          items << i
          total_price += i.price
        }
      }
      order_param = {:items => items, :total_price => total_price, :user_id => user.id}
      @order = Order.create(order_param)
    end
  end
end