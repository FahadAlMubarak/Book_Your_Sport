class FacilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    params[:venue_id]
    @venue = Venue.find(params[:venue_id])
    @facilities = @venue.facilities
    @date_range = (Date.today..(Date.today + 13)).to_a.map { |date| [date, date.strftime("%B %d")]}
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @slots = Slot.on_facility(@facilities).on_date(date)
    @selected_date = date
  end
end
