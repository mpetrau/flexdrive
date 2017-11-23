class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit,]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.valid?
      @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :colour, :manufactureYear, :KM, :fuelType, :enginePower, :status, :offer, :licensePlate)
  end

end
