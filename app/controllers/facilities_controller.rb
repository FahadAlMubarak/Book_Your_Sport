class FacilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_facility, only: [:show]


  def show
    @date_range = (Date.today..(Date.today + 6)).to_a.map { |date| [date, date.strftime(" %A %e %B")]}
    # @date_range = (Date.new(2000, 1, 1)..Date.new(2000, 1, 1) + 13).to_a.map { |date| [date, date.strftime(" %A %e %B")]}
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    # @slots = Slot.on_facility(@facilities).on_date(date)
    @selected_date = date
    @booking = Booking.new
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:sport)
  end
end
