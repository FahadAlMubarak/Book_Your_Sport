class Slot < ApplicationRecord
  belongs_to :facility
  has_many :bookings

  scope :on_facility, -> (facility_id) {
    where(facility_id: facility_id)
  }

  scope :on_date, -> (date) {
    where(date: date).select(:start_time, :end_time)
  }
end
