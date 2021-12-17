json.array! @areas do |area|
  json.extract! area, :id, :zone, :city, :post_code
end
