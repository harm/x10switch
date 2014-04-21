class Heyu
	def self.get_devices
		# execute Heyu commands
    # stub these in tests
    stub = %Q{
      [Aliases]
       alias  front_porch       A1    StdLM  
       alias  back_porch        A2    StdLM  
       alias  porch_lights      A1,2    
       alias  tv_set            A3    StdAM  
       alias  living_room       A4    LM14A  
       alias  patio_landscape   A8    StdAM  
       alias  patio_lamppost    A9    StdLM  
       alias  all_patio_lights  A8,9    
      }
    stub

    # devices = %x{ /usr/local/bin/heyu show alias }
    # devices
	end

  def self.get_scenes
    # execute Heyu commands
    # stub these in tests
    stub = %Q{
      scene  blinker  on A1; off A1; on A1; off A1
      scene  tv_on    on tv_set; dimb living_room 10
    }
    stub
    #scenes = %x{ /usr/local/bin/heyu show scenes }
    #scenes

  end

  def self.scene_command(scene_id)
    puts "*** Heyu executing: heyu turn #{scene_id} ***"
    %x{ /usr/local/bin/heyu #{scene_id} }
  end

  def self.dim_bright(id, dim_value, dim_bright)
    puts "*** Heyu executing: heyu #{dim_bright} #{id} #{dim_value}"
    %x{ /usr/local/bin/heyu #{dim_bright} #{id} #{dim_value} }
  end

  def self.on_off(id, on_or_off)
    puts "*** Heyu executing: heyu #{on_or_off} #{id}"
    %x{ /usr/local/bin/heyu #{on_or_off} #{id} }
  end

end
