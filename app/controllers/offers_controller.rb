# encoding: utf-8

class OffersController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_offer, except: [:index, :new, :create]
  before_filter :check_owner, except: [:index, :show, :new, :create]

  def index
    @search = Offer.search(params[:q])
    @offers = @search.result
  end

  def show; end

  def new
    @offer = Offer.new
    3.times {@offer.photos.build}
  end

  def create
    @offer = Offer.new(params[:offer].merge(:user_id => current_user.id))
    redirect_to user_offers_path(current_user)
  end

  def edit; end

  def update
    if @offer.update_attributes(params[:offer])
      redirect_to offers_path
    else
      render actipn: :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  def publish
    @offer.publish!
    redirect_to offers_path
  end

  def hide
    @offer.hide!
    redirect_to offers_path
  end

  private
  def find_offer
    @offer = Offer.find(params[:id])
  end

  def check_owner
    unless @offer.owned_by?(current_user) || current_user.admin?
      flash[:error] = "It's not your offer"
      redirect_to offers_path
    end
  end

end
