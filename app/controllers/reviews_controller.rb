class ReviewsController < ApplicationController
  before_action :find_booking
  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      respond_to do |format|
        format.html { redirect_to venue_path(@booking.slot.facility.venue), notice: 'Review submitted successfully.' }
        format.json { render json: @review, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_dashboard_path, alert: 'Error submitting review.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
