class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
  
end
