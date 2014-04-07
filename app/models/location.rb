class Location < ActiveRecord::Base
	require 'httparty'
	require 'open-uri'
	require 'json'

	attr_accessor :temp_f

	validates :zip, presence: true

	def get_geolookup_location(zip)
		response = HTTParty.get("http://api.wunderground.com/api/735c849d33f507e5/geolookup/conditions/q/#{zip}.json")
		self.city = response['location']['city']
		self.state = response['location']['state']
		self.zip = response['location']['zip']
		self.lat = response['location']['lat']
		self.lon = response['location']['lon']
		self.save
	end

	def get_current_observation(zip)
		response = HTTParty.get("http://api.wunderground.com/api/735c849d33f507e5/geolookup/conditions/q/#{zip}.json")
		self.temp_f = response['current_observation']['temp_f']
	end
end