class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def show
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path(@restaurant), status: :see_other
  end
end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end
