object(@vendor)

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
