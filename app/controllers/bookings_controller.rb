class BookingsController < ApplicationController

  respond_to :html, :json
  #  before_action :set_facility, only: [:create]
  def create
    # @slot = Slot.find(params[:slot_id])
    slots = params[:booking][:slots]
    @booking = Booking.new(start_time: slots[0][:start_time], end_time: slots[-1][:end_time], status: "pending")
    @booking.user = current_user
    if @booking.save!
      slots.each do |slot|
        @slot = Slot.find(slot[:id])
        faciliy_price_cents = @slot.facility.deposit_price_cents
        @booking.update(deposit_price_cents: faciliy_price_cents)
        @slot.update(booked: true, booking: @booking)
      end
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'gbp',
            unit_amount: @booking.deposit_price_cents,
            product_data: {
              name: @booking.slots.first.facility.venue.name
            }
          },
          quantity: 1
        }],
        mode: 'payment',
        success_url: booking_success_url(@booking),
        cancel_url:  checkout_summary_url(@booking)
      )

      @booking.update(checkout_session_id: session.id)
      redirect_to checkout_summary_path(@booking), notice: 'Booking is successful.'
    else
      redirect_to venues_path, alert: 'Booking failed. Please try again.'
    end

    # @booking.user = current_user
    # if @booking.save
    #   @slot.update(booked: true)
    #   redirect_to checkout_summary_path, notice: 'Booking is successful.'
    # else
    #   redirect_to venues_path, alert: 'Booking failed. Please try again.'
    # end
  end

  # def multi_create
  #   if params[:bookings][:slots].present?
  #     slots = params[:bookings][:slots]
  #     slots.each do |slot|
  #       @slot = Slot.find(slot[:id])
  #       @booking = Booking.new(slot_id: slot[:id], start_time: slots[0][:start_time], end_time: slots[-1][:end_time])
  #       @booking.user = current_user
  #       @booking.save!
  #       @slot.update(booked: true)
  #     end
  #     redirect_to checkout_summary_path(@booking)
  #   end
  # end

  # def multi_create
  #   if params[:bookings][:slots].present?
  #     slots = params[:bookings][:slots]
  #     slot_ids = slots.map { |slot| slot[:id] }

  #     # Ensure slots are consecutive
  #     sorted_slots = Slot.where(id: slot_ids).order(:start_time)
  #     consecutive = sorted_slots.each_cons(2).all? do |a, b|
  #       a.end_time == b.start_time
  #     end


  #     if consecutive
  #       Booking.transaction do
  #         slots.each do |slot|
  #           @slot = Slot.find(slot[:id])
  #           @booking = Booking.new(slot_id: slot[:id], start_time: sorted_slots.first.start_time, end_time: sorted_slots.last.end_time)
  #           @booking.user = current_user
  #           @booking.save!
  #           @slot.update!(booked: true)
  #         end
  #       end
  #       redirect_to checkout_summary_path(@booking)
  #   #   else
  #   #     @slot = Slot.find(slots[0][:id])
  #   #     @facility = @slot.facility
  #   #     @venue = @facility.venue
  #   #     @date_range = (Date.today..(Date.today + 13)).to_a.map { |date| [date, date.strftime(" %A %e %B")]}
  #   #     flash[:alert] = "You can only book consecutive time slots."
  #   #     # raise
  #   #     render "facilities/show", status: :unprocessable_entity, locals: { facility: @facility, venue: @venue, date_range: @date_range}
  #   #   end
  #   # else
  #   #   flash[:alert] = "No slots selected."
  #     end
  #   end
  # end

  def checkout_summary
    @booking = Booking.find(params[:id])
    @slots = @booking.slots
    @facility = @booking.slots.first.facility
    @venue = @facility.venue
    @total_price = @slots.count * @facility.price
    @remainder = @total_price - @facility.deposit_price.to_i
  end

  def checkout
    @booking = Booking.find(params[:id])

    redirect_to new_booking_payment_path(@booking)
  end

  def success
    @booking = Booking.find(params[:id])
  end

  private
  # def set_facility
  #   @facility = Facility.find(params[:facility_id])
  # end
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status)
  end

  def bookings_params
    params.require(:booking).permit(slots: [])
  end
end
