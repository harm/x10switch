class HomeController < ApplicationController
	def index
		@devices = Device.get_devices
		@scenes = Scene.get_scenes
	end

	def scene
		puts "*** received scene command ***"
		puts params
		Heyu.scene_command(params[:id])
		head 200, :content_type => 'text/html'
	end

	def dim_bright
		puts "*** received dim/bright command ***"
		Heyu.dim_bright(params[:id], params[:value], params[:dim_bright])
		head 200, :content_type => 'text/html'
	end

	def on_off
		puts "*** received bright command ***"
		Heyu.on_off(params[:id], params[:on_off])
		head 200, :content_type => 'text/html'
	end
end
