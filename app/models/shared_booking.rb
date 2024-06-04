class SharedBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :friend
end
