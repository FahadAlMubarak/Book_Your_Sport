class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :bookings

  has_many :friends, foreign_key: :user_1_id, class_name: 'Friend'
  has_many :friends, foreign_key: :user_2_id, class_name: 'Friend'

  has_one_attached :logo
end
