class PlantsController < ApplicationController

  #GET /plants this displays all of the plants
  def index
    plants = Plant.all 
    render json: plants
  end

  #GET /plants/:id this displays plants by ID only 
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  #POST /plants this creates a new plant with specific params and displays a status
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  #these are the strong params being used in the post request
  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
