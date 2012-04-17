class Vendor < ActiveRecord::Base
  has_attached_file :logo_image,
                    {
                      :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                      :url => "/system/logo/:id/:style/:basename.:extension",  
                      :path => ":rails_root/public/system/logo/:id/:style/:basename.:extension"
                    }
                    
  has_attached_file :dashboard_image,
                    {
                      :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                      :url => "/system/dashboard/:id/:style/:basename.:extension",  
                      :path => ":rails_root/public/system/dashboard/:id/:style/:basename.:extension"
                    }
  has_many :items
end
