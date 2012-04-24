class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :login]
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
  
  def login
    email = parsed_body[:email]
    password =  parsed_body[:password]

    if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json"}
        return
    end

    if email.nil? or password.nil? 
      render :status=>400, :json=>{:message=>"The request must contain the user email and password."}
      return
    end

    @user=User.find_by_email(email.downcase)

    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email or passoword."}
      return
    end

    @user.ensure_authentication_token
    @user.save!

    if not @user.valid_password?(password) 
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or passoword."} 
    else
      render :status=>200, :json=>{:token=>@user.authentication_token} 
    end
  end
  
end
