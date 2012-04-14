class Item < ActiveRecord::Base
  has_attached_file :avatar,
                    {
                      :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                      :url => "/system/:hash.:extension",
                      :hash_secret => "longSecretString"
                    }                    
  belongs_to  :vendor
end
