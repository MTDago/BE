json.extract! profile, :id, :user_name, :phone, :postcode, :rating, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
