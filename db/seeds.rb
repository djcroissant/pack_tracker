# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' },, { name: 'Copenhagen' },])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Expedition.create([
  { title: "Multi-Pitch Sport Climb", days: 3 },
  { title: "Rainforest Backpacking", days: 6 }
  ])

User.create([
  { name: "Jimbo", expeditions: Expedition.where(id: [1, 2]), email: 'jimbo@gmail.com', password: 'p' },
  { name: "Limbo", expeditions: Expedition.where(id: 1), email: 'limbo@gmail.com', password: 'p' },
  { name: "Dimbo", expeditions: Expedition.where(id: 1), email: 'dimbo@gmail.com', password: 'p' }
  ])

InventoryItem.create([
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 1 },
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 1 },
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 1 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 1 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 1 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 1 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 1 },
  { title: "Headlamp", description: "Derek's Petzl", weight: 200, user_id: 1 },
  { title: "Headlamp", description: "Lindsay's Petzl", weight: 200, user_id: 1 },
  { title: "Hiking Poles", description: "Lindsay's", weight: 1000, user_id: 1 },
  { title: "Hiking Poles", description: "Derek's", weight: 1100, user_id: 1 },
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 2 },
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 2 },
  { title: "Locking Carabiner", description: "", weight: 50, user_id: 2 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 2 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 2 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 3 },
  { title: "Non-Locking Carabiner", description: "", weight: 40, user_id: 3 },
  { title: "Headlamp", description: "Derek's Petzl", weight: 200, user_id: 3 },
  { title: "Headlamp", description: "Lindsay's Petzl", weight: 200, user_id: 3 },
  { title: "Hiking Poles", description: "Lindsay's", weight: 1000, user_id: 3 },
  { title: "Hiking Poles", description: "Derek's", weight: 1100, user_id: 3 }
  ])
