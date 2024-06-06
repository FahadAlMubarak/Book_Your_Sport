class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_venue, only: [:show]


  def index
    @venues = Venue.all
    @facilities = Facility.all
  end

  def show
    @facility = Facility.new
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
      if params[:venue][:images]
        @venue.images.attach(params[:venue][:images][0])
      end
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

private
  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :borough, :description, :phone, :email, :socials, :opening_time,
                                  :closing_time, tag_list: [], images: [],
    facilities_attributes: [:id, :name, :sport, :capacity, :price , :duration, :deposit_price])
  end


end
