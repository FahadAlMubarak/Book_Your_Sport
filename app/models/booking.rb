class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot
  has_one :review
  has_many :shared_bookings
end
