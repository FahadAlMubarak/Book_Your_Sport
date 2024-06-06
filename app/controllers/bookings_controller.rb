class BookingsController < ApplicationController
  def create
    @slot = Slot.find(params[:slot_id])
    @booking = @slot.bookings.build(booking_params)

    if @booking.save
      redirect_to facility_path(@facility), notice: 'Booking is successful.'
    else
      redirect_to facility_path(@facility), alert: 'Booking failed. Please try again.'
    end
  end
  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status)
  end
end
