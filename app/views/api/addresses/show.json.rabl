object(@address)

attributes :name, :building_type, :phone_number, :additional_detail, :id

child(:user) do 
 attributes :email, :id
end