class CustomErrorResponder < ActionController::Responder
  def json_resource_errors
    error_message = { :errors => resource.errors }
    unless resource.valid?
      error_message.merge!(:message => "Validation Error")
    end
    error_message
  end
end