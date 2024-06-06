class Venue < ApplicationRecord
  belongs_to :user
  has_many :facilities

  has_one_attached :photo
  has_many_attached :images

  scope :open_after, ->(time) { where('opening_time <= ?', time) }
  scope :close_before, ->(time) { where('closing_time >= ?', time) }

end
