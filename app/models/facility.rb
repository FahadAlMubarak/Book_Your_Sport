class Facility < ApplicationRecord
  belongs_to :venue
  has_many :slots, dependent: :destroy
  has_many :bookings, through: :slots

  validates :name, presence: true
  validates :sport, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validates :deposit_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :create_time_slots

  monetize :deposit_price_cents


def create_time_slots
  # Clear existing time slots
  self.slots.destroy_all

  time_zone = 'London'

  start_time = self.venue.opening_time.in_time_zone(time_zone)
  end_time = self.venue.closing_time.in_time_zone(time_zone)
  current_date = self.created_at.in_time_zone(time_zone).to_date

  (0..6).each do |day_offset|
    current_day = (current_date + day_offset.days).in_time_zone(time_zone)

    current_start_time = current_day.to_time + start_time.seconds_since_midnight.seconds
    current_end_time = current_day.to_time + end_time.seconds_since_midnight.seconds

    while current_start_time + self.duration.minutes <= current_end_time
      self.slots.create(start_time: current_start_time, end_time: current_start_time + self.duration.minutes)
      current_start_time += self.duration.minutes
    end
  end
end
end
