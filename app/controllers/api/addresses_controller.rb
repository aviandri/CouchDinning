class Api::AddressesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @address = Address.new(parsed_body)
    @address.user = current_user
    if !@address.save
      render :json => @address.errors, :status => :unprocessable_entity
    end
    redirect_to api_user_address_path(@address.user.id, @address.id)
  end
  
  def show
    @address = Address.find(params[:id])
  end
end
