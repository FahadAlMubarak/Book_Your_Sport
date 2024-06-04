class Friend < ApplicationRecord
  belongs_to :user_1, class_name: 'User', foreign_key: 'user_1_id', required: true
  belongs_to :user_2, class_name: 'User', foreign_key: 'user_2_id', required: true
  has_many :shared_bookings
end
