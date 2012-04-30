class ApplicationController < ActionController::Base
  protect_from_forgery
  
  HTTP_STATUS_BAD_REQUEST           = 400
  HTTP_STATUS_RECORD_NOT_FOUND      = 404
  HTTP_STATUS_FORBIDDEN             = 403
  HTTP_STATUS_INTERNAL_SERVER_ERROR = 500
  
  rescue_from(CustomException::AccessDenied) do
    render_error("Access Denied", HTTP_STATUS_FORBIDDEN)
  end
  
  rescue_from(CustomException::BadRequest) do
    render_error("Bad Request", HTTP_STATUS_BAD_REQUEST)
  end
  
  rescue_from(ActiveRecord::RecordNotFound) do
    render_error("Record not found", HTTP_STATUS_RECORD_NOT_FOUND)
  end
  
  def parse_body
    request_body = request.body.read
    if request_body.empty?
      return {}
    else
      @parsed_body ||= Yajl::Parser.parse(request_body, :symbolize_keys => true)
      raise ClientError::InvalidBody, "Problem parsing JSON" unless @parsed_body
      return @parsed_body
    end
  end
  
  def parsed_body
    @parsed_body ||= parse_body      
  end
  
  def force_json_request
    request.format = :json
  end
  
  def render_error(msg, status=200)
    render(:json => {:message => msg}, :status => status) and return
  end
  
end
