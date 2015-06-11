# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' },, { name: 'Copenhagen' },])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Expedition.create title:"Multi-Pitch Sport Climb", days:3

climbers = Climber.create([
  { name:"Jimbo", expedition_id:1 },
  { name:"Limbo", expedition_id:1 },
  { name:"Dimbo", expedition_id:1 }
  ])

inventory_items = InventoryItem.create([
  { title:"Locking Carabiner", description:"", weight:50, group_item:true },
  { title:"Locking Carabiner", description:"", weight:50, group_item:true },
  { title:"Locking Carabiner", description:"", weight:50, group_item:true },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true },
  { title:"Headlamp", description:"Derek's Petzl", weight:200, group_item:false },
  { title:"Headlamp", description:"Lindsay's Petzl", weight:200, group_item:false },
  { title:"Hiking Poles", description:"Lindsay's", weight:1000, group_item:false },
  { title:"Hiking Poles", description:"Derek's", weight:1100, group_item:false }
  ])

packed_items = PackedItem.create([
  { title:"Locking Carabiner", description:"", weight:50, group_item:true, climber_id:1 },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true, climber_id:1 },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true, climber_id:2 },
  { title:"Non-Locking Carabiner", description:"", weight:40, group_item:true, climber_id:3 },
  { title:"Headlamp", description:"Derek's Petzl", weight:200, group_item:false, climber_id:1 },
  { title:"Headlamp", description:"Lindsay's Petzl", weight:200, group_item:false, climber_id:2 },
  { title:"Hiking Poles", description:"Lindsay's", weight:1000, group_item:false, climber_id:3 },
  { title:"Hiking Poles", description:"Derek's", weight:1100, group_item:false, climber_id:3 }
  ])
