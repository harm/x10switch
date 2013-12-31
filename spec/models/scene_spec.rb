require 'spec_helper'

## 
# heyu command output:
# heyu show scenes
##
$SCENE_CONFIG = %Q{
  scene  blinker  on A1; off A1; on A1; off A1
  scene  tv_on    on tv_set; dimb living_room 10
}

describe Scene do
  it "should be able to create a scene ;)" do
  	s = Scene.new("blinker", "on A1; off A1; on A1; off A1")
  	expect(s.name).to eql("blinker")
  	expect(s.command).to eql("on A1; off A1; on A1; off A1")
  end
end

describe Scene, "read config" do
  it "should be able to parse heyu output" do
    Heyu.stub(:get_scenes){ $SCENE_CONFIG }
    scenes = Scene.get_scenes
    expect(scenes.count).to eql(2)
    expect(scenes[0].name).to eql("blinker")
    expect(scenes[1].command).to eql("on tv_set; dimb living_room 10")
  end
end