class PetsController < ApplicationController
  def index
    if params[:search].present?
      @pets = Pet.search(params[:search])
    else
      @pets = Pet.adoptable
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      redirect_to "/shelters/#{pet_params[:shelter_id]}/pets"
    else
      redirect_to "/shelters/#{pet_params[:shelter_id]}/pets/new"
      flash[:alert] = "Error: #{error_message(pet.errors)}"
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      redirect_to "/pets/#{pet.id}"
    else
      redirect_to "/pets/#{pet.id}/edit"
      flash[:alert] = "Error: #{error_message(pet.errors)}"
    end
  end

  def destroy
    Pet.find(params[:id]).destroy
    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:id, :name, :age, :breed, :adoptable, :shelter_id)
  end
end

# class PlantPlotsController < ApplicationController
#   def destroy
#     binding.pry
    # plant_plot = PlantPlot.find_by(plant_id: params[:id], plot_id: params[:plot_id])
#     # plant_plot = PlantPlot.find_by(plant_id: params[:format], plot_id: params[:plot_id])
#     plant_plot.destroy
#     redirect_to '/plots'
#    end
# end

# "/plots/#{plot.id}/plants/#{plant.id}"
# class PlantsController
#
#   def destroy
#     Plant.find(params[:id]).destroy
#     redirect_to
#   end             ##  SEE Routes

# class DishesController < ApplicationController
#
#   def destroy
#     # dish = Dish.find(params[:id])
#     # binding.pry
#     di = DishIngredient.where(ingredient_id: params[:ingredient_id], dish_id: params[:id]).first
#     di.destroy
#     redirect_to "/ingredients/#{params[:ingredient_id]}"
#   end
# end
