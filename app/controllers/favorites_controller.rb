class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    point = Point.find(params[:point_id])
    favorite = current_user.favorites.new(point_id: point.id)
    favorite.save
    redirect_to point_path(point)
  end

  def destroy
    point = Point.find(params[:point_id])
    favorite = current_user.favorites.find_by(point_id: point.id)
    favorite.destroy
    redirect_to point_path(point)
  end

end

