class Device

	attr_accessor :name, :address, :type

	def initialize (name, address, type='StdLM')  
  		@name = name  
  		@address = address  
  		@type = type
	end

	def self.get_devices
		devices = []
		heyu_output = Heyu.get_devices
  		heyu_output.each_line do |line|
  			array = line.strip.split
  			if array[0] == "alias"
  				if array[3].nil?
  					devices << Device.new(array[1], array[2])
  				else
  					devices << Device.new(array[1], array[2], array[3])
  				end
  			end
  		end
  	devices
	end
end