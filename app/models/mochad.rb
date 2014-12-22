SERVER = '192.168.0.32'

class Mochad
	def self.dim_bright(id, dim_value, dim_bright)
    %x{ echo "pl #{id} #{dim_bright} #{dim_value}" | nc #{MOCHAD_SERVER} #{MOCHAD_PORT}}
  end

  def self.on_off(id, on_or_off)
  	%x{ echo "pl #{id} #{on_or_off}" | nc #{MOCHAD_SERVER} #{MOCHAD_PORT}}
  end

  def self.scene_command(name)
  	@scene = Scene.find_by_name(name)
  	@scene.commands.split('|').each do |command|
  		puts command
  		%x{ echo "#{command}" | nc #{MOCHAD_SERVER} #{MOCHAD_PORT}}
  	end
  end
end
