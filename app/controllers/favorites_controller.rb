# encoding: utf-8

class FavoritesController < ApplicationController

  def create
    offer = Offer.find(params[:offer])
    if current_user.favorite_offers.include?(offer)
      flash[:notice] = "This offer is already in your favorites"
    else
      @favorite = current_user.favorites.create!({offer: offer})
      flash[:notice] = "Favorite added"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:notice] = "Favorite deleted"
  end

  def index
    @offers = current_user.favorited_offers
    render template: "offers/index"
  end

end
