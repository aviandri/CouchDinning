class Api::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :force_json_request
  
  def create
    items = parsed_body
    OrderService.create(current_user, items)
    head(:no_content)
  end
  
  def checkout
    order_ids = parsed_body[:order_ids]
    OrderService.checkout(order_ids)
    head(:no_content)
  end
  
  def index
    @orders = Order.find_by_user_id(current_user.id)
  end
  
  def show
    @order = Order.find(params[:id])
    if @order.user_id != current_user.id
      raise CustomException::AccessDenied
    end
  end
end
