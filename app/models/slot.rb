class Slot < ApplicationRecord
  belongs_to :facility
  belongs_to :booking, optional: true

  scope :on_facility, -> (facility_id) {
    where(facility_id: facility_id)
  }

  scope :on_day, ->(date) {
    where(start_time: date.beginning_of_day..date.end_of_day)
  }
end
