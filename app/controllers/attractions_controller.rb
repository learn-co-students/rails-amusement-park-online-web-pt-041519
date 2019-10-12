class AttractionsController < ApplicationController
  before_action :current_user

  # Show all attractions
  def index
    @attractions = Attraction.all
  end

  # Display new attraction form
  def new
    @attraction = Attraction.new
  end

  # Create new attraction
  def create
    @attraction = Attraction.new(attr_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  # Display edit attraction form
  def edit
    @attraction = Attraction.find(params[:id])
  end

  # Update attraction
  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attr_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  # Display attraction
  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  # Delete attraction
  def delete
  end

  # Activate ride. Update user and display messages.
  def ride
    ride = Ride.create(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    attr = Attraction.find_by(id: params[:ride][:attraction_id])
  
    message = ride.take_ride
    if !message.is_a?(String)
      flash[:success] = "Thanks for riding the #{ride.attraction.name}!" 
      redirect_to user_path(ride.user)
    else 
      flash[:error] = message
      redirect_to user_path(ride.user)
    end
  end

  private
 
  def attr_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
