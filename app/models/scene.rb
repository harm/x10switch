class Scene
	attr_accessor :name, :command

	def initialize (name, command)
  		@name = name  
  		@command = command
	end

	def self.get_scenes
		scenes = []
		heyu_output = Heyu.get_scenes
  		heyu_output.each_line do |line|
  			array = line.strip.split
  			if array[0] == "scene"
  				scenes << Scene.new(array[1], line.split(array[1])[1].strip)
  			end
  		end
  	scenes
	end
end
