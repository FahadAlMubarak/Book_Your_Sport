class Slot < ApplicationRecord
  belongs_to :facility
  has_many :bookings
end
