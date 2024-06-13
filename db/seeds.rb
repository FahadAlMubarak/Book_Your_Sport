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

Review.destroy_all
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
user_1.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_1.save

user_2 = User.create(
  email: "david@email.com",
  first_name: "david",
  last_name: "hopkins",
  phone: "0208 121 82892",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: true
)


user_3 = User.create(
  email: "esme@email.com",
  first_name: "esme",
  last_name: "chong",
  phone: "0208 121 8777",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: false
)

user_4 = User.create(
  email: "bob@email.com",
  first_name: "bob",
  last_name: "the builder",
  phone: "0208 121 8299",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456",
  owner: true
)

user_5 = User.create(
  email: "gareth@email.com",
  first_name: "gareth",
  last_name: "southgate",
  phone: "0208 121 8290",
  address: "England",
  password: "123456",
  owner: true
)

# Padium

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
venue_1.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_1.save


# URLs of additional images
venue_1_image_urls = [
  "https://static.wixstatic.com/media/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg/v1/fill/w_1376,h_1560,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg",
  "https://static.wixstatic.com/media/e27881_10fdd12a580245849f9c37ef6117cac4~mv2.jpg/v1/fill/w_1376,h_1296,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/e27881_10fdd12a580245849f9c37ef6117cac4~mv2.jpg",
  "https://static.wixstatic.com/media/e27881_7fb990c1ea214988a004916a42f072c7~mv2.jpg/v1/fill/w_1376,h_1296,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/e27881_7fb990c1ea214988a004916a42f072c7~mv2.jpg"
]

# Attach additional images
venue_1_image_urls.each do |url|
  file = URI.open(url)
  venue_1.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end


facility_padium_1 = Facility.create!(

  venue: venue_1,
  name: "Court 1",
  sport: "padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 50
)

facility_padium_2 = Facility.create!(

  venue: venue_1,
  name: "Court 2",
  sport: "padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 50
)

# facility_padium_3 = Facility.create!(

#   venue: venue_1,
#   name: "Court 3",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 50
# )

# facility_padium_4 = Facility.create!(

#   venue: venue_1,
#   name: "Court 4",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 50
# )

# facility_padium_5 = Facility.create!(

#   venue: venue_1,
#   name: "Outdoor court",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 4,
#   price: 75
# )

# Powerleague

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
venue_2.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_2.save

# URLs of additional images
venue_2_image_urls = [
  "https://wp-pp.preprod.powerleague.com/wp-content/uploads/2022/12/2Y8A2387.webp",
  "https://www.powerleague.com/wp-content/uploads/2023/02/Website4re.webp",
  "https://www.powerleague.com/wp-content/uploads/2022/12/home.webp"
]

# Attach additional images
venue_2_image_urls.each do |url|
  file = URI.open(url)
  venue_2.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end


facility_powerleague_1 = Facility.create!(

  venue: venue_2,
  name: "6-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 12,
  price: 100
)


facility_powerleague_2 = Facility.create!(

  venue: venue_2,
  name: "11-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 22,
  price: 150
)

# facility_powerleague_3 = Facility.create!(

#   venue: venue_2,
#   name: "5-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 5,
#   capacity: 10,
#   price: 50
# )


# Hurlingham

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
venue_3.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_3.save

# URLs of additional images
venue_3_image_urls = [
  "https://images.squarespace-cdn.com/content/v1/56b8afcb2fe13136784391c0/1649070594829-NJTR6P1ES55GMN36RKD8/DSC_7977a.jpg?format=1500w",
  "https://images.squarespace-cdn.com/content/v1/56b8afcb2fe13136784391c0/3bc8f923-34e9-4caf-9202-607a5477621b/2023.06.27_Georgio-Armani-Tennis-Classic-D1_Reportage_01_1566.jpg?format=1500w",
  "https://images.squarespace-cdn.com/content/v1/56b8afcb2fe13136784391c0/1533818289907-Y60QMXXIXUZNFI85P2RH/SO2_2285.jpg?format=1500w"
]

# Attach additional images
venue_3_image_urls.each do |url|
  file = URI.open(url)
  venue_3.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end

facility_hurlingham_1 = Facility.create!(

  venue: venue_3,
  name: "Clay court 1",
  sport: "tennis",
  duration: 120,
  deposit_price: 50,
  capacity: 4,
  price: 100
)

facility_hurlingham_2 = Facility.create!(

  venue: venue_3,
  name: "Clay court 2",
  sport: "tennis",
  duration: 120,
  deposit_price: 50,
  capacity: 4,
  price: 100
)

# facility_hurlingham_3 = Facility.create!(

#   venue: venue_3,
#   name: "Grass court 1",
#   sport: "tennis",
#   duration: 120,
#   deposit_price: 50,
#   capacity: 4,
#   price: 100
# )


# facility_hurlingham_4 = Facility.create!(

#   venue: venue_3,
#   name: "Grass court 2",
#   sport: "tennis",
#   duration: 120,
#   deposit_price: 50,
#   capacity: 4,
#   price: 100
# )

# facility_hurlingham_5 = Facility.create!(

#   venue: venue_3,
#   name: "Indoor court",
#   sport: "tennis",
#   duration: 120,
#   deposit_price: 30,
#   capacity: 4,
#   price: 80
# )


# Goals


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
venue_4.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_4.save

# URLs of additional images
venue_4_image_urls = [
  "https://cinsulddca.cloudimg.io/https://cdn.goalsfootball.co.uk/media/r1xnzgtz/5aside-3.jpg",
  "https://cinsulddca.cloudimg.io/https://cdn.goalsfootball.co.uk/media/3cefmfj3/ki.jpg",
  "https://cinsulddca.cloudimg.io/https://cdn.goalsfootball.co.uk/media/03rjxzjm/book-a-game.jpg"
]

# Attach additional images
venue_4_image_urls.each do |url|
  file = URI.open(url)
  venue_4.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end


facility_goals_1 = Facility.create!(

  venue: venue_4,
  name: "6-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 12,
  price: 80
)


facility_goals_2 = Facility.create!(

  venue: venue_4,
  name: "11-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 22,
  price: 120
)

# facility_goals_3 = Facility.create!(

#   venue: venue_4,
#   name: "5-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 5,
#   capacity: 10,
#   price: 30
# )

# Viccy park

venue_5 = Venue.create(
  name: "Victoria Park ",
  address: "Victoria Park East, St Marks Gate, London, E9 5HT",
  borough: "Hackney",
  description: "A variety of different football pitches in the heart of London!",
  phone: "020 3589 4612",
  email: "contact@victoriapark.com",
  socials: "Instagram: @fc_victoriapark",
  opening_time: "11:00 PM",
  closing_time: "21:00 PM",
  user: user_2,
  sports:"football"
)

file = URI.open("https://scontent-lhr6-1.xx.fbcdn.net/v/t39.30808-1/299186967_373098948327268_5000616583953068579_n.png?stp=dst-png_p480x480&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=e9sf3fcyMBQQ7kNvgEx_ofx&_nc_ht=scontent-lhr6-1.xx&oh=00_AYCASOehn1OSbYjNUvzTKPluN-bskafxH7njc76EAGooDw&oe=666F2990")
venue_5.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_5.save

# URLs of additional images
venue_5_image_urls = [
  "https://germinalamenity.com/media/ggb/wp/wp-content/uploads/2022/12/Football-pitch-maintenance-Stirling-Albion.webp",
  "https://hireapitch.com/PitchImages/90364a93-7452-489e-926c-6c937aec93f2.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/1/13/Sunday_morning_football_at_Victoria_Park_-_geograph.org.uk_-_1326364.jpg"
]

# Attach additional images
venue_5_image_urls.each do |url|
  file = URI.open(url)
  venue_5.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end


facility_viccypark_1 = Facility.create!(

  venue: venue_5,
  name: "6-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 12,
  price: 60
)


facility_viccypark_2 = Facility.create!(

  venue: venue_5,
  name: "11-a-side",
  sport: "football",
  duration: 60,
  deposit_price: 20,
  capacity: 22,
  price: 80
)

# facility_viccypark_3 = Facility.create!(

#   venue: venue_5,
#   name: "5-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 5,
#   capacity: 10,
#   price: 30
# )


# padel

venue_6 = Venue.create(
  name: "Padel social club",
  address: "Empress Place, London, SW6 1TT",
  borough: "London",
  description: "Step into our world-class debut padel club, nestled in the heart of West London’s Earls Court.",
  phone: "+44 (0) 739 354 5770",
  email: "contact@padelsocial.com",
  socials: "Instagram: @padelsocialclub",
  opening_time: "07:00 PM",
  closing_time: "22:00 PM",
  user: user_2,
  sports:"padel"
)

file = URI.open("https://s3-eu-west-1.amazonaws.com/assets-s3.thisaway.co/_1200x630_crop_center-center_82_none/PSC_Card.png?mtime=1710260859")
venue_6.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_6.save

# URLs of additional images
venue_6_image_urls = [
  "https://padelsocial.club/cdn/shop/files/hoverreveal1-min_1080x.jpg?v=1714636675",
  "https://padelsocial.club/cdn/shop/files/hp5-min_1080x.jpg?v=1714647455",
  "https://padelsocial.club/cdn/shop/files/Facilities-padel-courts-p-1600_1512x.jpg?v=1714743041"
]

# Attach additional images
venue_6_image_urls.each do |url|
  file = URI.open(url)
  venue_6.images.attach(io: file, filename: File.basename(url), content_type: "image/jpeg")
end

facility_padelsocialclub_1 = Facility.create!(

  venue: venue_6,
  name: "Court 1",
  sport: "padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 50
)

facility_padelsocialclub_2 = Facility.create!(

  venue: venue_6,
  name: "Court 2",
  sport: "padel",
  duration: 60,
  deposit_price: 10,
  capacity: 4,
  price: 60
)

# facility_padelsocialclub_3 = Facility.create!(

#   venue: venue_6,
#   name: "Court 3",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 60
# )

# facility_padelsocialclub_4 = Facility.create!(

#   venue: venue_6,
#   name: "Court 4",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 60
# )

# facility_padelsocialclub_5 = Facility.create!(

#   venue: venue_6,
#   name: "Outdoor court",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 4,
#   price: 100
# )



Slot.create!(
facility: facility_padelsocialclub_1,
booked: false,
start_time: DateTime.new(2024,06,11,9,0,0,"+1"),
end_time: DateTime.new(2024,06,11,10,0,0,"+1")
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
