require 'spec_helper'

## 
# heyu command output:
# heyu show alias a
##
$HEYU_CONFIG = %Q{
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

describe Device do
	it "should be able to construct devices" do
		d = Device.new("Living lights", "A2", "StdLM")
		expect(d.name).to eq("Living lights")
		expect(d.address).to eq("A2")
		expect(d.type).to eq("StdLM")
	end

	it "should assume StdLM if not provided" do
		d = Device.new("Living lights", "A2")
		expect(d.type).to eq("StdLM")
	end
end

describe Device, "reading config" do
  it "should be able to parse the heyu config" do
  	Heyu.stub(:get_devices){ $HEYU_CONFIG }
    devices = Device.get_devices
    devices.count.should eql(8)
    expect(devices[0].name).to eql("front_porch")
    expect(devices[7].name).to eql("all_patio_lights")
    expect(devices[7].type).to eql("StdLM")
  end
end
