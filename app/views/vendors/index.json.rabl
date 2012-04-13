collection @vendors, :object_root => false
attributes :name, :description
node(:avatar_url) do |i|
  attributes :full   => i.avatar.url,
             :medium => i.avatar.url(:medium),
             :thumb  => i.avatar.url(:thumb)
end