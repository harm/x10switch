class HomeController < ApplicationController
	def index
		h = Heyu.new
		@devices = h.get_devices
	end
end
