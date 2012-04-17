object(@item)

attributes :name, :description
node(:created_at) do |c|
  c.created_at.to_i
end
node(:updated_at) do |c|
  c.updated_at.to_i
end
node(:avatar_url) do |i|
  attributes :full   => i.avatar.url,
             :medium => i.avatar.url(:medium),
             :thumb  => i.avatar.url(:thumb)
end

child(:vendor) do 
 attributes :name, :description
 node(:created_at) do |c|
 	c.created_at.to_i
 end
 node(:updated_at) do |c|
  c.updated_at.to_i
 end

 node(:logo_image) do |i|
	attributes :full   => i.logo_image.url,
	             :medium => i.logo_image.url(:medium),
	             :thumb  => i.logo_image.url(:thumb)
 end

 node(:dashboard_image) do |i|
	  attributes :full   => i.dashboard_image.url,
	             :medium => i.dashboard_image.url(:medium),
	             :thumb  => i.dashboard_image.url(:thumb)
 end

end