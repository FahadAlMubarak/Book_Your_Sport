class Facility < ApplicationRecord
  belongs_to :venue
  has_many :slots
end
