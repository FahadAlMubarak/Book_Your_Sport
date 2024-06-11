# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

Friend.destroy_all
Facility.destroy_all
Venue.destroy_all
Booking.destroy_all
User.destroy_all

user_1 = User.create(
  email: "fahad@email.com",
  first_name: "Fahad",
  last_name: "Almubarak",
  phone: "123456",
  address: "138 Kingsland Rd, London E2 8DY",
  password: "123456",
  owner: false
)

file = URI.open("https://media.licdn.com/dms/image/D4E03AQFohqu7scaWTw/profile-displayphoto-shrink_200_200/0/1699433378820?e=2147483647&v=beta&t=qK1YKOYKLkkFGnN0rz55_g72CN3XKb3JQQ0gH9q3a3o")
user_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_1.save

user_2 = User.create(
  email: "david@email.com",
  first_name: "david",
  last_name: "hopkins",
  phone: "123456",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: true
)


user_3 = User.create(
  email: "esme@email.com",
  first_name: "esme",
  last_name: "chong",
  phone: "123456",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: false
)

user_4 = User.create(
  email: "bob@email.com",
  first_name: "bob",
  last_name: "the builder",
  phone: "123456",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: true
)


venue_1 = Venue.create(
  name: "Padium",
  address: "10 Bank St, London E14 4DE",
  borough: "Canary Wharf",
  description: "Padium offers the ultimate blend of competitive gameplay and social camaraderie. ",
  phone: "07950 852054",
  email: "contact@padelpadium.com",
  socials: "Instagram: @padel_padium",
  opening_time: "06:00 AM",
  closing_time: "11:00 PM",
  user: user_2,
  sports:"padel"
)

file = URI.open("https://static.wixstatic.com/media/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png/v1/fill/w_192%2Ch_192%2Clg_1%2Cusm_0.66_1.00_0.01/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png")
venue_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_1.save

file = URI.open("https://static.wixstatic.com/media/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg/v1/fill/w_1376,h_1560,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg")
venue_1.images.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_1.save

venue_2 = Venue.create(
  name: "Powerleague",
  address: "Braithwaite Street, London E1 6GJ",
  borough: "Islington",
  description: "Football chain with outdoor 5- or 7-a-side pitches and organised league facilities.",
  phone: "020 7749 9900",
  email: "contact@powerleaguefootbal.com",
  socials: "Instagram: @powerleague",
  opening_time: "09:00 AM",
  closing_time: "10:00 PM",
  user: user_4,
  sports:"football"
)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOS5Sr2kVK3ahwMFE4MEtVYw7gvJSkFyNBg&s")
venue_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_2.save


file = URI.open("https://wp-pp.preprod.powerleague.com/wp-content/uploads/2022/12/2Y8A2387.webp")
venue_2.images.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_2.save


venue_3 = Venue.create(
  name: "Hurlingham Club",
  address: "Ranelagh Gardens, London SW6 3PR",
  borough: "Fulham",
  description: "The Hurlingham Club is a green oasis of tradition and international renown bordering the River Thames.",
  phone: "020 7610 7500",
  email: "reception@hurlinghamclub.org.uk",
  socials: "Instagram: @thehurlinghamclub",
  opening_time: "06:15 AM",
  closing_time: "11:30 PM",
  user: user_4,
  sports:"tennis"
)

file = URI.open("https://hurlinghamclub.org.uk/media/qkdfwpih/hurlingham_club_logo.svg?width=275&height=138")
venue_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_3.save


file = URI.open("https://hurlinghamclub.org.uk/media/00cn4d32/the-hurlingham-club-exterior.png?center=0.46212729548007481,0.5018112488083889&mode=crop&width=1440&height=449&rnd=133528954485870000")
venue_3.images.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_3.save

venue_4 = Venue.create(
  name: "Goals",
  address: "7 Beverley Way, London, SW20 0UJ",
  borough: "Wimbledon",
  description: "Goals Wimbledon offers the best small-sided football facilities in the city. Simple.",
  phone: "020 8949 1122",
  email: "emailwimbledon@goalsfootball.co.uk",
  socials: "Instagram: @goals_wimbledon",
  opening_time: "10:00 AM",
  closing_time: "11:00 PM",
  user: user_4,
  sports:"football"
)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrx5eC0xoRLW-o2JSZ_bom96W9Lzp2ln-RmQ&s")
venue_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_4.save

file = URI.open("https://cinsulddca.cloudimg.io/https://cdn.goalsfootball.co.uk/media/r1xnzgtz/5aside-3.jpg")
venue_4.images.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_4.save


venue_5 = Venue.create(
  name: "Pimlico Academy",
  address: "10 Bank St, London E14 4DE",
  borough: "Canary Wharf",
  description: "Padium offers the ultimate blend of competitive gameplay and social camaraderie. ",
  phone: "07950 852054",
  email: "contact@padelpadium.com",
  socials: "Instagram: @padel_padium",
  opening_time: "06:00 AM",
  closing_time: "11:00 PM",
  user: user_2,
  sports:"padel"
)

file = URI.open("https://static.wixstatic.com/media/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png/v1/fill/w_192%2Ch_192%2Clg_1%2Cusm_0.66_1.00_0.01/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png")
venue_5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_5.save

file = URI.open("https://static.wixstatic.com/media/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg/v1/fill/w_1376,h_1560,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg")
venue_5.images.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_5.save



facility_1 = Facility.create!(

  venue: venue_1,
  name: "court 1",
  sport: "Padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 50
)

facility_2 = Facility.create!(
  venue: venue_2,
  name: "grass pitch",
  sport: "Football",
  capacity: 10,
  price: 70,
  duration: 90,
  deposit_price: 20
)

facility_3 = Facility.create!(
  venue: venue_3,
  name: "centre court",
  sport: "Tennis",
  capacity: 4,
  price: 100,
  duration: 120,
  deposit_price: 30
)

# Slot.create(
#   facility: facility_1,
#   start_time: Time.new(2024, 6, 4, 8, 0, 0),
#   end_time: Time.new(2024, 6, 4, 9, 0, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_1,
#   start_time: Time.new(2024, 6, 4, 9, 0, 0),
#   end_time: Time.new(2024, 6, 4, 10, 0, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_2,
#   start_time: Time.new(2024, 6, 10, 10, 0, 0),
#   end_time: Time.new(2024, 6, 10, 11, 30, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_3,
#   start_time: Time.new(2024, 6, 9, 15, 0, 0),
#   end_time: Time.new(2024, 6, 9, 16, 0, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_1,
#   start_time: Time.new(2024, 6, 7, 15, 0, 0),
#   end_time: Time.new(2024, 6, 7, 16, 0, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_1,
#   start_time: Time.new(2024, 6, 7, 18, 0, 0),
#   end_time: Time.new(2024, 6, 7, 19, 0, 0),
#   date: Date.today,
#   status: "available"
# )

# Slot.create(
#   facility: facility_1,
#   start_time: Time.new(2024, 6, 8, 21, 0, 0),
#   end_time: Time.new(2024, 6, 8, 22, 0, 0),
#   date: Date.tomorrow,
#   status: "available"
# )

# (0..13).each do |day_offset|
#   date = Date.today + day_offset

#   Slot.create(
#     facility: facility_1,
#     start_time: Time.new(date.year, date.month, date.day, 9, 0, 0),
#     end_time: Time.new(date.year, date.month, date.day, 10, 0, 0),
#     date: date,
#     status: "available",
#     booked: false
#   )

#   Slot.create(
#     facility: facility_1,
#     start_time: Time.new(date.year, date.month, date.day, 12, 0, 0),
#     end_time: Time.new(date.year, date.month, date.day, 13, 0, 0),
#     date: date,
#     status: "available",
#     booked: false
#   )

#   Slot.create(
#     facility: facility_1,
#     start_time: Time.new(date.year, date.month, date.day, 15, 0, 0),
#     end_time: Time.new(date.year, date.month, date.day, 16, 0, 0),
#     date: date,
#     status: "available",
#     booked: false
#   )
# end

puts "Slots created for facility_1 from today to today+13 with multiple slots each day."
