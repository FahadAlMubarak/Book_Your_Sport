class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_venue, only: [:show,:edit, :update, :destroy]

  def index
    @venues = Venue.all

    @venues = Venue.filter_by_price(params[:price])

    # Search logic
    @venues = Venue.search(params[:search]) if params[:search].present?

    # Opening and closing time filters
    open_time = Time.parse(params[:open_after]) if params[:open_after].present?
    close_time = Time.parse(params[:close_before]) if params[:close_before].present?
    @venues = @venues.where('opening_time >= ?', open_time) if open_time
    @venues = @venues.where('closing_time <= ?', close_time) if close_time

    # Filter logic

    @facilities = Facility.all

    if params[:query] == 'detailed_filters'
      selected_sports = []
      selected_sports << params[:padel] if params[:padel].present?
      selected_sports << params[:basketball] if params[:basketball].present?
      selected_sports << params[:football] if params[:football].present?
      selected_sports << params[:tennis] if params[:tennis].present?
      selected_sports << params[:netball] if params[:netball].present?
      selected_sports << params[:badminton] if params[:badminton].present?
      selected_sports << params[:table_tennis] if params[:table_tennis].present?
      selected_sports << params[:quidditch] if params[:quidditch].present?

      if selected_sports.present?
        @venues = @venues.select { |venue| selected_sports.include?(venue.sports) }
      end
    end

    respond_to do |format|
      format.html
      format.text { render partial: "venues/list", locals: { venues: @venues }, formats: [:html] }
    end
  end


  def show
    @facility = Facility.new

    @markers =
      [{
        lat: @venue.latitude,
        lng: @venue.longitude
      }]



    @facilities = @venue.facilities
    bookings = @facilities.map { |facility| facility.bookings }.flatten
    reviewed_bookings = bookings.select {|booking| booking.review unless booking.review.nil? }
    reviews = reviewed_bookings.map { |booking| booking.review }
    @reviews = reviews.uniq
  end

  def new
    @venue = Venue.new
    @venue.facilities.build
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to @venue, notice: "Your venue was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @venue.destroy
    @venue.facilities.destroy_all
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :sports, :address, :borough, :description,:logo, :phone, :email, :socials, :opening_time,
                                  :closing_time, tag_list: [], images: [],
    facilities_attributes: [:id, :name, :sport, :capacity, :price , :duration, :deposit_price])
  end
end
