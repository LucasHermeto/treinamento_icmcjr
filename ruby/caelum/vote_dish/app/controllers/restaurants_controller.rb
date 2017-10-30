class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order :name
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to action: 'index'
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurat = Restaurant.new(restaurant_params)
    @restaurat.save
    redirect_to(action: 'show', id: @restaurat)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(restaurant_params)
    redirect_to(action: 'show', id: @restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :specialty)
  end
end
