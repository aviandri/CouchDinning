class Order < ActiveRecord::Base
  belongs_to  :vendor
  has_many    :order_items
  has_many    :items, :through => :order_items
  
  attr_reader :status_to_s
  
  STATUS_CART      = 0
  STATUS_PROCESSED = 1
  STATUS_DELIVERED = 2
  
  STATUS_STRING = ["CART", "PROCESSED", "DELIVERED"]
  
  def status_to_s
    STATUS_STRING[self.status]
  end
  
  def self.find_by_user_id(user_id)
    Order.where(:featured => true)
  end
  
end
