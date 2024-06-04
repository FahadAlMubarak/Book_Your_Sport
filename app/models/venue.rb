class Venue < ApplicationRecord
  belongs_to :user
  has_many :facilities

  has_one_attached :photo
  has_one_attached :image
end
