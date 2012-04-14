object(@vendor)

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
