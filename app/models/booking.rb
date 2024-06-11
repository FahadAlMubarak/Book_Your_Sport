class Booking < ApplicationRecord
  belongs_to :user

  has_many :slots
  has_one :review

  has_many :shared_bookings


  # all the slots in the booking will belong to the same facility, therefore we can call .first
  def venue
    slots.map { |slot| slot.facility.venue }.first
  end

  def venue_address
    return nil unless venue

    venue.address
  end

  monetize :deposit_price_cents

end
