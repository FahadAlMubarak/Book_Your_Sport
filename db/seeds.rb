# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
  address: "321 Padel Court, Padel City, PC 65432",
  description: "A state-of-the-art Padel court offering professional-grade facilities and coaching.",
  phone: "2233445566",
  email: "contact@padelproarena.com",
  socials: "Twitter: @PadelPro, Facebook: /PadelProArena",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 22, 0, 0),
  user: user_2
)

venue_2 = Venue.create(
  name: "Greenfield Sports Complex",
  address: "456 Sports Lane, Sportstown, SP 45678",
  description: "football",
  phone: "1234567890",
  email: "contact@greenfieldsports.com",
  socials: "Twitter: @GreenfieldSports, Facebook: /GreenfieldSports",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 22, 0, 0),
  user: user_4
)

venue_3 = Venue.create(
  name: "Tennis Elite Club",
  address: "789 Tennis Drive, Tennis Town, TT 98765",
  description: "Premier tennis club with multiple courts and professional coaching available.",
  phone: "3344556677",
  email: "info@tenniselite.com",
  socials: "Instagram: @TennisElite, Facebook: /TennisEliteClub",
  opening_time: Time.new(2024, 6, 4, 9, 0, 0),
  closing_time: Time.new(2024, 6, 4, 10, 0, 0),
  user: user_4
)

facility_1 = Facility.create(
  venue: venue_1,
  sport: "Padel",
  capacity: 4,
  price: 50,
  duration: 60,
  deposit_price: 10
)

facility_2 = Facility.create(
  venue: venue_2,
  sport: "Football",
  capacity: 2,
  price: 70,
  duration: 90,
  deposit_price: 20
)

facility_3 = Facility.create(
  venue: venue_3,
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
  start_time: Time.new(2024, 6, 4, 10, 0, 0),
  end_time: Time.new(2024, 6, 4, 11, 30, 0),
  date: Date.today,
  status: "available"
)

Slot.create(
  facility: facility_3,
  start_time: Time.new(2024, 6, 4, 15, 0, 0),
  end_time: Time.new(2024, 6, 4, 16, 0, 0),
  date: Date.today,
  status: "available"
)
