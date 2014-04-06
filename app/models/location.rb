class Location < ActiveRecord::Base
	require 'httparty'
	require 'open-uri'
	require 'json'

	attr_accessor :temp_f

	validates :zip, presence: true

	def get_geolookup_location(zip)
		response = HTTParty.get("http://api.wunderground.com/api/735c849d33f507e5/geolookup/conditions/q/#{zip}.json")
		@location = Location.new
  		@location.city = response['location']['city']
		@location.state = response['location']['state']
		@location.zip = response['location']['zip']
		@location.lat = response['location']['lat']
		@location.lon = response['location']['lon']
		@location.save
	end

	def get_current_observation(zip)
		response = HTTParty.get("http://api.wunderground.com/api/735c849d33f507e5/geolookup/conditions/q/#{zip}.json")
		temp_f = response['current_observation']['temp_f']
	end
end