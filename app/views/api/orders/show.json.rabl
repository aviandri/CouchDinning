object(@order)

attributes :total_price, :status_to_s, :id
node(:created_at) do |c|
  c.created_at.to_i
end
node(:updated_at) do |c|
  c.updated_at.to_i
end

child :items do
  extends "api/items/show"
end

