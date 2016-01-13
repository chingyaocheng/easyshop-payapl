json.array!(@orders) do |order|
  json.extract! order, :id, :name, :ship_to_address, :phone_number, :ship_to_name, :ship_to_phone_number, :status, :customer_ip, :email
  json.url order_url(order, format: :json)
end
