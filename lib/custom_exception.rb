module CustomException
  class AccessDenied < Exception; end
  class DifferentVendorOrder < Exception; end
  class BadRequest < Exception; end
  class InternalServerError < Exception; end
end