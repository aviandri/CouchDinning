object(@address)

attributes :name, :building_type, :phone_number, :additional_detail

child(:user) do 
 attributes :email, :id
end