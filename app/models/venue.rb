class Venue < ApplicationRecord
  belongs_to :user
  has_many :facilities

  has_one_attached :photo
  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true
  validates :sports, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :slots, through: :facilities

  accepts_nested_attributes_for :facilities, reject_if: proc { |attributes| attributes["name"].blank? }
  # after_create :create_slots

  def self.search(search)
    if search.present?
      where('name ILIKE ?', "%#{search}%")
    else
     Venue.all
    end
  end

  def self.filter_by_price(price)
    case price
    when '£'
      joins(:facilities).where('facilities.price < ?', 15)
    when '££'
      joins(:facilities).where('facilities.price >= ? AND facilities.price <= ?', 15, 30)
    when '£££'
      joins(:facilities).where('facilities.price > ?', 50)
    else
      Venue.all
    end
  end

  private

  # def create_slots
  #   facilities.each do |facility|
  #     # Assuming opening_time and closing_time are attributes of Venue
  #     start_time = opening_time
  #     end_time = closing_time
  #     while start_time < end_time
  #       (Date.today..Date.today + 2.weeks).to_a.each do |day|
  #         temp_start_time = DateTime.new(Date.today.year, Date.today.month, Date.today.day, start_time.hour, start_time.to_datetime.minute, 0)
  #         facility.slots.create(start_time: temp_start_time, end_time: temp_start_time + facility.duration.minutes)
  #       end
  #       start_time += facility.duration.minutes
  #     end
  #   end
  # end

end
