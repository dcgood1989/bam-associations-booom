class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to flights_path
      flash[:notice] = "Successfully created flight to #{@flight.destination.location}"
    else
      flash[:notice] = "Error creating flight"
      render :new
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to flights_path, notice: 'Flight successfully updated'
    else
      render :edit
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_date, :airplane_id, :destination_id)
  end
end
