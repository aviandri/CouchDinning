class Api::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :force_json_request
  
  def create
    items = parsed_body
    OrderService.create(current_user, items)
    head(:no_content)
  end
end
