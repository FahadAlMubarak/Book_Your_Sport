class Booking < ApplicationRecord
  belongs_to :user

  has_many :slots
  has_one :review

  has_many :shared_bookings
  monetize :deposit_price_cents
end
