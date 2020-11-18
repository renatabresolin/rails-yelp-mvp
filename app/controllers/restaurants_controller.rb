class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :chef, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
  end

  def update
    if @restaurant.update(params_restaurant)
      redirect_to @restaurant, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.save
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path(@restaurant), notice: 'Successfully deleted!'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
