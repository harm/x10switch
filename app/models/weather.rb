require 'net/http'
require 'pp'
require 'rufus-scheduler'



class Weather
	def self.get_data
		base_url = "http://api.openweathermap.org/data/2.5/weather?lat=51.27150&lon=5.56636&units=metric"
		resp = Net::HTTP.get_response(URI.parse(base_url))
		data = resp.body
		File.open("weather.json", 'w') {|f| f.write(data) }
	end

	def self.schedule_switch_lights
		weather = JSON.parse(IO.read('weather.json'))
		
		sunrise = Time.at(weather['sys']['sunrise'].to_i).to_datetime
		sunset  = Time.at(weather['sys']['sunset'].to_i).to_datetime

		sunset = sunset + 10.hours

		pp sunset.strftime("%Y-%m-%d %H-%M-%S %z")

		scheduler = Rufus::Scheduler.new
		
		scheduler.at sunset.strftime("%Y-%m-%d %H-%M-%S %z") do
			Heyu.on_off('a9', 'on') 
		end

	end

end