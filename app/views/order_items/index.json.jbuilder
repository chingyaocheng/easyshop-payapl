json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :product_id, :order_id, :price, :quantity
  json.url order_item_url(order_item, format: :json)
end
