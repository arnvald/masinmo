# encoding: utf-8

class FavoritesController < ApplicationController

  before_filter :authenticate_user!

  def create
    offer = Offer.find(params[:offer])
    if @favorite = current_user.favorites.find_by_offer_id(offer.id)
      flash.now[:notice] = "Already favorite"
    else
      @favorite = current_user.favorites.create!({offer: offer})
      flash.now[:notice] = "Favorite added"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash.now[:notice] = "Favorite deleted"
  end

  def index
    @offers = current_user.favorite_offers.page(params[:page] || 1)
    render template: "offers/index"
  end
end
