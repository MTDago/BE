json.extract! order, :id, :user_id, :ammount, :seller, :title, :created_at, :updated_at
json.url order_url(order, format: :json)
