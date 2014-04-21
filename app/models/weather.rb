require 'net/http'
require 'rubygems'
require 'json'
require 'pp'
require_relative 'settings'

class Weather
	def self.get_data
		base_url = "http://api.openweathermap.org/data/2.5/weather?lat=51.27150&lon=5.56636&units=metric"
		resp = Net::HTTP.get_response(URI.parse(base_url))
		data = resp.body
		File.open("weather.json", 'w') {|f| f.write(data) }
	end
end