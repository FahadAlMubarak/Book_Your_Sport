class BookingsController < ApplicationController
  #  before_action :set_facility, only: [:create]
  def create
    @slot = Slot.find(params[:slot_id])
    @booking = @slot.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      @slot.update(booked: true)
      redirect_to venues_path, notice: 'Booking is successful.'
    else
      redirect_to venues_path, alert: 'Booking failed. Please try again.'
    end
  end
  private
  # def set_facility
  #   @facility = Facility.find(params[:facility_id])
  # end
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status)
  end
end
