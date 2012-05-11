class Vendor < ActiveRecord::Base
  has_attached_file :logo_image,
                    {
                      :styles => { :medium => "360x280>", :thumb => "100x100>" }, 
                      :url => "/system/logo/:id/:style/:basename.:extension",  
                      :path => ":rails_root/public/system/logo/:id/:style/:basename.:extension"
                    }
                    
  has_attached_file :dashboard_image,
                    {
                      :styles => { :medium => "300x120>", :thumb => "145x60>" }, 
                      :url => "/system/dashboard/:id/:style/:basename.:extension",  
                      :path => ":rails_root/public/system/dashboard/:id/:style/:basename.:extension"
                    }
  has_many :items
  
  def self.find_featured
    Vendor.where(:featured => true)
  end
  
end
