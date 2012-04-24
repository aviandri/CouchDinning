class Order < ActiveRecord::Base
  belongs_to  :vendor
  has_many    :order_items
  has_many    :items, :through => :order_items
  
  def create
    
  end
end
