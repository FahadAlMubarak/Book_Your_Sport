class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_venue, only: [:show]


  def index
    @venues = Venue.all
    # Apply opening and closing time filters
    open_time = Time.parse(params[:open_after]) if params[:open_after].present?
    close_time = Time.parse(params[:close_before]) if params[:close_before].present?

    @venues = @venues.where('opening_time >= ?', open_time) if open_time
    @venues = @venues.where('closing_time <= ?', close_time) if close_time
  end

  def show
    @facility = Facility.new
  end

  def new
    @venue = Venue.new
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
    params.require(:venue).permit(:name, :address, :borough, :description, :phone, :emails, :socials, :opening_time, :closing_time, tag_list: [], images: [])
  end


end
