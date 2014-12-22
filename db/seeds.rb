# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Device.create(name: "Keuken Wand", address: 'A1')
Device.create(name: "Woonkamer spots", address: 'A2')   
Device.create(name: "Woonkamer tafel", address: 'A3')	
Device.create(name: "Keuken Spots",	address: 'A4')
Device.create(name: "Hal beneden", address: 'A6')	
Device.create(name: "Hal entree", address: 'A7')	
Device.create(name: "Hal boven", address: 'A8')	
Device.create(name: "Spots Slaapkamer", address: 'A9')	
Device.create(name: "Slaapkamer Tijmen", address: 'A10')	
Device.create(name: "Slaapkamer Jasmijn", address: 'A11')  
Device.create(name: "Studeerkamer", address: 'A13')	
Device.create(name: "Spots voordeur (buiten)", address: 'A14')	
Device.create(name: "Radio Badkamer", address: 'A15')	
Device.create(name: "Nachtlamp bed (Harm)", address: 'B1')
Device.create(name: "Stofzuiger charger", address: 'B2')
Device.create(name: "Screens grote pui", address: 'B4')
Device.create(name: "Screens kleine pui", address: 'B5')
Device.create(name: "Voortuin boom", address: 'B9')
Device.create(name: "A5", address: 'A5')
Device.create(name: "A12", address: 'A12')

Scene.create(name: "All off", commands: "pl a all_lights_off")
Scene.create(name: "All on", commands: "pl a all_lights_on")
Scene.create(name: "Zonwering omlaag", commands: "pl b4 off|pl b5 off")
Scene.create(name: "Zonwering omhoog", commands: "pl b5 on|pl b4 on")