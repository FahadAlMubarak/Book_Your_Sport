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

  start_time = self.venue.opening_time
  end_time = self.venue.closing_time
  current_date = self.created_at.to_date

  (0..13).each do |day_offset|
    current_day = current_date + day_offset.days

    current_start_time = current_day.to_time + start_time.seconds_since_midnight.seconds
    current_end_time = current_day.to_time + end_time.seconds_since_midnight.seconds

    while current_start_time + self.duration.minutes <= current_end_time
      self.slots.create(start_time: current_start_time, end_time: current_start_time + self.duration.minutes)
      current_start_time += self.duration.minutes
    end
  end
end
end
