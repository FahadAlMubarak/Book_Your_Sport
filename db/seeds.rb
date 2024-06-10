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

Booking.destroy_all
Friend.destroy_all
Slot.destroy_all
Facility.destroy_all
Venue.destroy_all
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
  name: "Padel Pro Arena",
  address: "221 High St, London E15 2AE",
  borough: "Stratford",
  description: "A state-of-the-art Padel court offering professional-grade facilities and coaching.",
  phone: "2233445566",
  email: "contact@padelproarena.com",
  socials: "Twitter: @PadelPro, Facebook: /PadelProArena",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 22, 0, 0),
  user: user_2,
  sports:"padel"
)

file = URI.open("https://plus.unsplash.com/premium_photo-1708692921020-e58a86c83b5a?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
venue_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_1.save

venue_2 = Venue.create(
  name: "Greenfield Sports Complex",
  address: "London E2 8NS",
  borough: "Hackney",
  description: "football",
  phone: "1234567890",
  email: "contact@greenfieldsports.com",
  socials: "Twitter: @GreenfieldSports, Facebook: /GreenfieldSports",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 22, 0, 0),
  user: user_4,
  sports:"football"
)

file = URI.open("https://images.unsplash.com/photo-1589487391730-58f20eb2c308?q=80&w=3574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
venue_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_2.save


venue_3 = Venue.create(
  name: "Tennis Elite Club",
  address: "Ranelagh Gardens,, Royal Hospital Road,, Chelsea, London SW3 4SR",
  borough: "Chelsea",
  description: "Premier tennis club with multiple courts and professional coaching available.",
  phone: "3344556677",
  email: "info@tenniselite.com",
  socials: "Instagram: @TennisElite, Facebook: /TennisEliteClub",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 10, 0, 0),
  user: user_4,
  sports:"tennis"
)
file = URI.open("https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
venue_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_3.save




facility_1 = Facility.create(
  venue: venue_1,
  name: "court 1",
  sport: "Padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 50,
)

facility_2 = Facility.create(
  venue: venue_2,
  name: "grass pitch",
  sport: "Football",
  capacity: 10,
  price: 70,
  duration: 90,
  deposit_price: 20
)

facility_3 = Facility.create(
  venue: venue_3,
  name: "centre court",
  sport: "Tennis",
  capacity: 4,
  price: 100,
  duration: 120,
  deposit_price: 30
)

Slot.create(
  facility: facility_1,
  start_time: Time.new(2024, 6, 4, 8, 0, 0),
  end_time: Time.new(2024, 6, 4, 9, 0, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_1,
  start_time: Time.new(2024, 6, 4, 9, 0, 0),
  end_time: Time.new(2024, 6, 4, 10, 0, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_2,
  start_time: Time.new(2024, 6, 10, 10, 0, 0),
  end_time: Time.new(2024, 6, 10, 11, 30, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_3,
  start_time: Time.new(2024, 6, 9, 15, 0, 0),
  end_time: Time.new(2024, 6, 9, 16, 0, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_1,
  start_time: Time.new(2024, 6, 7, 15, 0, 0),
  end_time: Time.new(2024, 6, 7, 16, 0, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_1,
  start_time: Time.new(2024, 6, 7, 18, 0, 0),
  end_time: Time.new(2024, 6, 7, 19, 0, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_1,
  start_time: Time.new(2024, 6, 8, 21, 0, 0),
  end_time: Time.new(2024, 6, 8, 22, 0, 0),
  date: Date.tomorrow,
  status: "available"
)

(0..13).each do |day_offset|
  date = Date.today + day_offset

  Slot.create(
    facility: facility_1,
    start_time: Time.new(date.year, date.month, date.day, 9, 0, 0),
    end_time: Time.new(date.year, date.month, date.day, 10, 0, 0),
    date: date,
    status: "available",
    booked: false
  )

  Slot.create(
    facility: facility_1,
    start_time: Time.new(date.year, date.month, date.day, 12, 0, 0),
    end_time: Time.new(date.year, date.month, date.day, 13, 0, 0),
    date: date,
    status: "available",
    booked: false
  )

  Slot.create(
    facility: facility_1,
    start_time: Time.new(date.year, date.month, date.day, 15, 0, 0),
    end_time: Time.new(date.year, date.month, date.day, 16, 0, 0),
    date: date,
    status: "available",
    booked: false
  )
end

puts "Slots created for facility_1 from today to today+13 with multiple slots each day."
