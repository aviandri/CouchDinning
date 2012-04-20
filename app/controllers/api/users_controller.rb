class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  before_filter :force_json_request
  
  def create
    user = User.new(parsed_body)
    if !user.save
      render :json => user.errors, :status => :unprocessable_entity
    else
      user.ensure_authentication_token
      user.save!
      render :status=>200, :json=>{:token=>user.authentication_token}
    end
  end  
end
