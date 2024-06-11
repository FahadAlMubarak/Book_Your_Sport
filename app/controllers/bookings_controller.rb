class BookingsController < ApplicationController

  respond_to :html, :json
  #  before_action :set_facility, only: [:create]
  def create
    @slot = Slot.find(params[:slot_id])
    @booking = @slot.bookings.build(booking_params)
    @booking.user = current_user
    @booking.state = "pending"
    if @booking.save
      @slot.update(booked: true)
      redirect_to checkout_summary_path, notice: 'Booking is successful.'
    else
      redirect_to venues_path, alert: 'Booking failed. Please try again.'
    end
  end

  def multi_create
    if params[:bookings][:slots].present?
      slots = params[:bookings][:slots]
      slots.each do |slot|
        @slot = Slot.find(slot[:id])
        @booking = Booking.new(slot_id: slot[:id], start_time: slots[0][:start_time], end_time: slots[-1][:end_time])
        @booking.user = current_user
        @booking.save!
        @slot.update(booked: true)
      end
      redirect_to checkout_summary_path(@booking)
    end
    # slots = params[:slots]
    # bookings = []

    # Slot.transaction do
    #   begin
    #     slots.each do |slot_params|
    #       slot = Slot.find(slot_params[:slot_id])
    #       booking = slot.bookings.build(
    #         start_time: slot_params[:start_time],
    #         end_time: slot_params[:end_time],
    #         status: 'Booked',
    #         user: current_user
    #       )

    #       if booking.save
    #         slot.update!(booked: true)
    #         bookings << booking
    #       else
    #         raise ActiveRecord::Rollback, "Booking failed for slot #{slot.id}"
    #       end
    #     end

    #     render json: { success: true, message: 'Bookings are successful.' }, status: :ok
    #   rescue => e
    #     render json: { success: false, message: e.message }, status: :unprocessable_entity
    #     raise ActiveRecord::Rollback
    #   end
    # end
  end

  def checkout_summary
    @booking = Booking.find(params[:id])
    @slots = current_user.bookings.where(start_time: @booking.start_time, end_time: @booking.end_time).map {|booking| booking.slot}
    @facility = @booking.slot.facility
    @total_price = @slots.count * @facility.price
    @remainder = @total_price - @facility.deposit_price.to_i
  end

  def checkout
    @booking = Booking.find(params[:id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: booking.slot.facility.venue.name,
        amount: booking.deposit_price_cents,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: booking_url(@booking),
      cancel_url:  booking_url(@booking)
    )

    @booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(@booking)
  end

  private
  # def set_facility
  #   @facility = Facility.find(params[:facility_id])
  # end
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status)
  end

  def booking_params
    params.require(:bookings).permit(slots: [])
  end
end
