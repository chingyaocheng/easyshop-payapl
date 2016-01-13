json.array!(@assets) do |asset|
  json.extract! asset, :id, :image, :product_id
  json.url asset_url(asset, format: :json)
end
