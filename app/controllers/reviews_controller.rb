class ReviewsController < ApplicationController
  before_action :find_booking
  def new
    @review = Review.new
  end
  def create
    if @booking.review.present?
      # render 'pages/user_dashboard', status: :unprocessable_entity
      redirect_to user_dashboard_path, notice: "Review already exists"
    else
      @review = Review.new(review_params)
      @review.booking = @booking
      if @review.save
        redirect_to venue_path(@booking.slots.first.facility.venue), notice: 'Review submitted successfully.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content,:booking_id)
  end
end
