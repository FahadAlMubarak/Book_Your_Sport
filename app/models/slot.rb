class Slot < ApplicationRecord
  belongs_to :facility
  has_many :bookings

  scope :on_facility, -> (facility_id) {
    where(facility_id: facility_id)
  }

  scope :on_day, ->(date) {
    where(start_time: date.beginning_of_day..date.end_of_day)
  }
end
