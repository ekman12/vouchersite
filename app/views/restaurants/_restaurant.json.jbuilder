json.extract! restaurant, :id, :name, :latitude, :longitude, :city, :neighbourhood, :address, :website, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
