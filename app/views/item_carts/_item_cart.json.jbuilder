json.extract! item_cart, :id, :quantity, :unit_price, :created_at, :updated_at
json.url item_cart_url(item_cart, format: :json)
