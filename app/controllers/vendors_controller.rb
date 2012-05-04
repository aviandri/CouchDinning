class VendorsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /vendors
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  def show
    @vendor = Vendor.find(params[:id])
  end

  # GET /vendors/new
  # GET /vendors/new.json
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(params[:vendor])
    if @vendor.save
        redirect_to @vendor, notice: 'Vendor was successfully created.'
    else
        render action: "new"
    end
  end

  # PUT /vendors/1
  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(params[:vendor])
      redirect_to @vendor, notice: 'Vendor was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /vendors/1
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to vendors_url
  end
  
  def list
    @vendors = Vendor.all
  end
end
