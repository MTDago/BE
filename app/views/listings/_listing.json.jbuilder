json.extract! listing, :id, :product_name, :product_price, :product_description, :product_image, :product_duration, :order_status, :user_name, :created_at, :updated_at
json.url listing_url(listing, format: :json)
