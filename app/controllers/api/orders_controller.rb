class Api::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :force_json_request
  
  def create
    item_ids = parsed_body[:item_ids]
    if !item_ids
      raise CustomException::BadRequest "item_ids not found"
    end
    @order = OrderService.create(current_user, item_ids)
  end
end
