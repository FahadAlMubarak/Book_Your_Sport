class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot
  has_many :reviews
  has_many :shared_bookings
end
