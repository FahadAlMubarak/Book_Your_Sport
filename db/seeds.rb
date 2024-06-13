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

# USERS

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

file = URI.open("https://ca.slack-edge.com/T02NE0241-U06UW4QEKCG-ee930e3fb830-192")
user_1.logo.attach(io: file, filename: "fahad.png", content_type: "image/png")
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

file = URI.open("https://ca.slack-edge.com/T02NE0241-U06ULBLH2GZ-2449159bdda0-192")
user_2.logo.attach(io: file, filename: "david.png", content_type: "image/png")
user_2.save


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

user_6 = User.create(
  email: "dumbledore@email.com",
  first_name: "albus",
  last_name: "dumbledore",
  phone: "0208 789 4738",
  address: "Alnwick",
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
  opening_time: Time.new(2024, 6, 13, 10, 0 , 0),
  closing_time: Time.new(2024, 6, 13, 15, 0 , 0),
  user: user_4,
  sports:"padel"
)

file = URI.open("https://static.wixstatic.com/media/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png/v1/fill/w_192%2Ch_192%2Clg_1%2Cusm_0.66_1.00_0.01/a72dea_8b826855f6dd4e9fa05b19eba1fef4f5%7Emv2.png")
venue_1.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_1.save


# Attach the image
file = URI.open("https://static.wixstatic.com/media/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg/v1/fill/w_1376,h_1560,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/e27881_fcf705249cd44f5280d113e08597ad26~mv2.jpg")
venue_1.images.attach(io: file, filename: "padium.jpg", content_type: "image/jpeg")



# facility_padium_1 = Facility.create!(

#   venue: venue_1,
#   name: "Court 1",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 50
# )

# facility_padium_2 = Facility.create!(

#   venue: venue_1,
#   name: "Court 2",
#   sport: "padel",
#   duration: 60,
#   deposit_price: 10,
#   capacity: 4,
#   price: 50
# )

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
  opening_time: Time.new(2024, 6, 13, 10, 0, 0),
  closing_time: Time.new(2024, 6, 13, 12, 0, 0),
  user: user_4,
  sports:"football"
)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOS5Sr2kVK3ahwMFE4MEtVYw7gvJSkFyNBg&s")
venue_2.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_2.save


# Attach the image
file = URI.open("https://wp-pp.preprod.powerleague.com/wp-content/uploads/2022/12/2Y8A2387.webp")
venue_2.images.attach(io: file, filename: "powerleague.jpg", content_type: "image/jpeg")




# facility_powerleague_1 = Facility.create!(

#   venue: venue_2,
#   name: "6-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 12,
#   price: 100
# )


# facility_powerleague_2 = Facility.create!(

#   venue: venue_2,
#   name: "11-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 22,
#   price: 150
# )

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
  opening_time: Time.new(2024, 6, 13, 17, 0 , 0),
  closing_time: Time.new(2024, 6, 13, 21, 0 , 0),
  user: user_4,
  sports:"tennis"
)

file = URI.open("https://hurlinghamclub.org.uk/media/qkdfwpih/hurlingham_club_logo.svg?width=275&height=138")
venue_3.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_3.save


# Attach the image
file = URI.open("https://images.squarespace-cdn.com/content/v1/56b8afcb2fe13136784391c0/1649070594829-NJTR6P1ES55GMN36RKD8/DSC_7977a.jpg?format=1500w",)
venue_3.images.attach(io: file, filename: "hurlingham.jpg", content_type: "image/jpeg")


# facility_hurlingham_1 = Facility.create!(

#   venue: venue_3,
#   name: "Clay court 1",
#   sport: "tennis",
#   duration: 120,
#   deposit_price: 50,
#   capacity: 4,
#   price: 100
# )

# facility_hurlingham_2 = Facility.create!(

#   venue: venue_3,
#   name: "Clay court 2",
#   sport: "tennis",
#   duration: 120,
#   deposit_price: 50,
#   capacity: 4,
#   price: 100
# )

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
  opening_time: Time.new(2024, 6, 13, 14, 0 , 0),
  closing_time: Time.new(2024, 6, 13, 20, 0 , 0),
  user: user_4,
  sports:"football"
)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrx5eC0xoRLW-o2JSZ_bom96W9Lzp2ln-RmQ&s")
venue_4.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_4.save


# Attach the image
file = URI.open("https://cinsulddca.cloudimg.io/https://cdn.goalsfootball.co.uk/media/r1xnzgtz/5aside-3.jpg",)
venue_4.images.attach(io: file, filename: "goals.jpg", content_type: "image/jpeg")

# facility_goals_1 = Facility.create!(

#   venue: venue_4,
#   name: "6-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 12,
#   price: 80
# )


# facility_goals_2 = Facility.create!(

#   venue: venue_4,
#   name: "11-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 22,
#   price: 120
# )

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
  opening_time: Time.new(2024, 6, 13, 8, 0, 0),
  closing_time: Time.new(2024, 6, 13, 10, 0 , 0),
  user: user_2,
  sports:"football"
)

file = URI.open("https://scontent-lhr6-1.xx.fbcdn.net/v/t39.30808-1/299186967_373098948327268_5000616583953068579_n.png?stp=dst-png_p480x480&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=e9sf3fcyMBQQ7kNvgEx_ofx&_nc_ht=scontent-lhr6-1.xx&oh=00_AYCASOehn1OSbYjNUvzTKPluN-bskafxH7njc76EAGooDw&oe=666F2990")
venue_5.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_5.save


# Attach the image
file = URI.open("https://germinalamenity.com/media/ggb/wp/wp-content/uploads/2022/12/Football-pitch-maintenance-Stirling-Albion.webp",)
venue_5.images.attach(io: file, filename: "victoria_park.jpg", content_type: "image/jpeg")



# facility_viccypark_1 = Facility.create!(

#   venue: venue_5,
#   name: "6-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 12,
#   price: 60
# )


# facility_viccypark_2 = Facility.create!(

#   venue: venue_5,
#   name: "11-a-side",
#   sport: "football",
#   duration: 60,
#   deposit_price: 20,
#   capacity: 22,
#   price: 80
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
  opening_time: Time.new(2024, 6, 13, 9, 0 , 0),
  closing_time: Time.new(2024, 6, 13, 21, 0 , 0),
  user: user_4,
  sports:"padel"
)

# Attach the image
file = URI.open("https://static.independent.co.uk/2023/03/17/07/GettyImages-1474017515.jpg")
venue_6.images.attach(io: file, filename: "fulham.jpg", content_type: "image/jpeg")


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



Slot.create!(
facility: facility_padelsocialclub_1,
booked: false,
start_time: DateTime.new(2024,06,11,9,0,0,"+1"),
end_time: DateTime.new(2024,06,11,10,0,0,"+1")
)

# venue 7

venue_7 = Venue.create(
  name: "Chelsea Harbour Club",
  address: "Watermeadow Lane, Fulham, Hammersmith and Fulham, SW6 2RR",
  borough: "London",
  description: "Whether you're new to this racquets sport or you want to improve your game, we offer group and private Padel lessons in London led by professional coaches.",
  phone: "+44 (0) 234 347 2890",
  email: "contact@chelseaharbourclub.com",
  socials: "Instagram: @chelseaharbourclub",
  opening_time: Time.new(2024, 6, 13, 9, 0, 0),
  closing_time: Time.new(2024, 6, 13, 18, 0, 0),
  user: user_1,
  sports:"padel"
)

file = URI.open("https://www.ukpadel.org/wp-content/uploads/2022/10/Chelsea-Harbour-Club.png")
venue_7.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_7.save

image_url = "https://www.davidlloyd.co.uk/cms/images/softwire-david-lloyd/image/upload/f_auto/v1/Harbour%20Club/Chelsea/p1smpv15zemdlrlnctoz.jpg"

# Attach the image
file = URI.open(image_url)
venue_7.images.attach(io: file, filename: "chelsea.jpg", content_type: "image/jpeg")

# venue 8

venue_8 = Venue.create(
  name: "Hogwarts",
  address: "Alnwick NE66 1NQ",
  borough: "Northumberland",
  description: "Pick up your brooms and challenge yourself against our snitch!",
  phone: "0789678937",
  email: "contact@hogwarts.com",
  socials: "Instagram: @hogwartsquidditch",
  opening_time: Time.new(2024, 6, 13, 9, 0, 0),
  closing_time: Time.new(2024, 6, 13, 17, 0, 0),
  user: user_6,
  sports:"quidditch"
)

file = URI.open("https://1000logos.net/wp-content/uploads/2021/04/Hogwarts-Logo.png")
venue_8.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_8.save

# Attach the image
file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/d/d3/Hogwarts_Quidditch_Pitch_in_1996_HBPF.jpg/revision/latest?cb=20210719213600")
venue_8.images.attach(io: file, filename: "hogwarts.jpg", content_type: "image/jpeg")



# venue 9

venue_9 = Venue.create(
  name: "Arsenal football club",
  address: "Emirates Stadium, Highbury House, 75 Drayton Park, London N5 1BU",
  borough: "London",
  description: "Play football with the greatest! Our pitches and our staff are some of the best.",
  phone: "0789676787",
  email: "contact@arsenal.com",
  socials: "Instagram: @arsenalfootball",
  opening_time: Time.new(2024, 6, 13, 10, 0, 0),
  closing_time: Time.new(2024, 6, 13, 19, 0, 0),
  user: user_5,
  sports:"football"
)

file = URI.open("https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png")
venue_9.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_9.save


# Attach the image
file = URI.open("https://static.independent.co.uk/2023/03/17/07/GettyImages-1474017515.jpg")
venue_9.images.attach(io: file, filename: "fulham.jpg", content_type: "image/jpeg")

# venue 10

venue_10 = Venue.create(
  name: "Fulham football club",
  address: "Craven Cottage, Stevenage Rd, London SW6 6HH",
  borough: "Hammersmith",
  description: "You can now play football with professional football players on our impeccable pitches.",
  phone: "0789348937",
  email: "contact@fulhamfootball.com",
  socials: "Instagram: @fullhamfootballclub",
  opening_time: Time.new(2024, 6, 13, 10, 0, 0),
  closing_time: Time.new(2024, 6, 13, 19, 0, 0),
  user: user_5,
  sports:"football"
)

file = URI.open("https://upload.wikimedia.org/wikipedia/en/e/eb/Fulham_FC_%28shield%29.svg")
venue_10.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_10.save


# Attach the image
file = URI.open("https://www.fulham-fc.co.uk/wp-content/uploads/fulham-team-europa-league-final.jpg")
venue_10.images.attach(io: file, filename: "fulham.jpg", content_type: "image/jpeg")

# venue 11

venue_11 = Venue.create(
  name: "Brentford football club",
  address: "166 Lionel Rd N, Brentford, United Kingdom.",
  borough: "Brentford",
  description: "We have lots of pitches and lots of facilities to offer you. Come and visit and meet our team.",
  phone: "0789348789",
  email: "contact@brentfordfootball.com",
  socials: "Instagram: @brentfordfootballclub",
  opening_time: Time.new(2024, 6, 13, 13, 0, 0),
  closing_time: Time.new(2024, 6, 13, 20, 0, 0),
  user: user_2,
  sports:"football"
)

file = URI.open("https://upload.wikimedia.org/wikipedia/en/thumb/2/2a/Brentford_FC_crest.svg/1200px-Brentford_FC_crest.svg.png")
venue_11.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_11.save


# Attach the image
file = URI.open("https://res.cloudinary.com/brentford-fc/image/upload/f_auto,q_auto:best,f_auto,q_100,c_fill,ar_16:9/Production/20230408-145913-0001_bcwvmz.jpg")
venue_11.images.attach(io: file, filename: "fulham.jpg", content_type: "image/jpeg")


# venue 12

venue_12 = Venue.create(
  name: "Wimbledon tennis club",
  address: "Home Park Rd, London, SW19 7HR.",
  borough: "Wimbledon",
  description: "The home of tennis. Come get in your whites and play on some of the best pitches you've ever seen.",
  phone: "0789348789",
  email: "contact@wimbledontennis.com",
  socials: "Instagram: @wimbledontennisclub",
  opening_time: Time.new(2024, 6, 13, 13, 0, 0),
  closing_time: Time.new(2024, 6, 13, 20, 0, 0),
  user: user_5,
  sports:"tennis"
)

file = URI.open("https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/Wimbledon.svg/1200px-Wimbledon.svg.png")
venue_12.logo.attach(io: file, filename: "nes.png", content_type: "image/png")
venue_12.save


# Attach the image
file = URI.open("https://media.cnn.com/api/v1/images/stellar/prod/230706154110-01-russia-ukraine-wimbledon.jpg?c=original")
venue_12.images.attach(io: file, filename: "fulham.jpg", content_type: "image/jpeg")



# SLOTS

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
