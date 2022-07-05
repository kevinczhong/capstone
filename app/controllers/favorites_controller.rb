class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites.as_json
  end

  def create
    favorite = Favorite.create(
      user_id: params[:user_id],
      property_id: params[:property_id],
    )
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
  end
end
