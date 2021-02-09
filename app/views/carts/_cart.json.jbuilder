json.extract! cart, :id, :user_name, :user_id, :bill_date, :created_at, :updated_at
json.url cart_url(cart, format: :json)
