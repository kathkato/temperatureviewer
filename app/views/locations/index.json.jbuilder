json.array!(@locations) do |location|
  json.extract! location, :id, :city, :state, :zip, :lat, :lon
  json.url location_url(location, format: :json)
end
