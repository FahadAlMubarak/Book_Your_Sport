class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_before_action :authenticate_user!, only: :home
  def home
  end



  def user_dashboard
    # @bookings = current_user.bookings.where('start_time >=NOW()::time')
    @bookings =current_user.bookings.to_a.sort_by! { |booking| booking.start_time }.chunk_while { |booking, next_booking| booking.start_time ==  next_booking.start_time && booking.end_time == next_booking.end_time }

    @past_bookings = current_user.bookings.where('start_time <= NOW()::time')







    @friends = Friend.where(user_1_id: current_user.id).or(Friend.where(user_2_id: current_user.id))
  end

  def owner_dashboard
      @venues = current_user.venues.all
  end

def users_index
@users = User.where.not(id: current_user.id)
end

end
