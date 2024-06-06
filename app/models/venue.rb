class Venue < ApplicationRecord
  belongs_to :user
  has_many :facilities

  has_one_attached :photo
  has_many_attached :images

  accepts_nested_attributes_for :facilities, reject_if: proc { |attributes| attributes["sport"].blank? }
  after_create :create_slots
  private

  def create_slots
    facilities.each do |facility|
      # Assuming opening_time and closing_time are attributes of Venue
      start_time = opening_time
      end_time = closing_time
      while start_time < end_time
        facility.slots.create(start_time: start_time, end_time: start_time + facility.duration.minutes)
        start_time += facility.duration.minutes
      end
    end
  end
end
