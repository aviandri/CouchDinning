object(@order)

attributes :total_price, :id
node(:created_at) do |c|
  c.created_at.to_i
end
node(:updated_at) do |c|
  c.updated_at.to_i
end

