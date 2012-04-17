class Api::VendorsController < ApplicationController
  before_filter :force_json_request
  
    # GET /api/vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /api/vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])
  end

end
