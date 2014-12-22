class HomeController < ApplicationController
	def index
		@devices = Device.all
		@scenes = Scene.all
	end

	def scene
		puts "*** received scene command ***"
		puts params
		Mochad.scene_command(params[:id])
		head 200, :content_type => 'text/html'
	end

	def dim_bright
		puts "*** received dim/bright command ***"
		Mochad.dim_bright(params[:id], params[:value], params[:dim_bright])
		head 200, :content_type => 'text/html'
	end

	def on_off
		puts "*** received on_off command ***"
		Mochad.on_off(params[:id], params[:on_off])
		head 200, :content_type => 'text/html'
	end
end
