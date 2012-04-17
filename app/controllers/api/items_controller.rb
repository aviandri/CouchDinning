class Api::ItemsController < ApplicationController
  before_filter :force_json_request
  
  # GET /api/items.json
  def index
    @items = Item.where(:vendor_id => params[:vendor_id].to_i)
  end
  
  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
