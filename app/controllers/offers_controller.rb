# encoding: utf-8

class OffersController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_offer, except: [:index, :new, :create]
  before_filter :check_owner, except: [:index, :show, :new, :create]

  def index
    if params[:user_id] && current_user && current_user.id == params[:user_id].to_i
      @search = current_user.offers.search(params[:q])
    else
      @search = Offer.published.search(params[:q])
    end
    @offers = @search.result.page(params[:page] || 1)
  end

  def show; end

  def new
    @offer = Offer.new
    3.times {@offer.photos.build}
  end

  def create
    @offer = Offer.new(params[:offer].merge(:user_id => current_user.id))
    if @offer.save
      redirect_to user_offers_path(current_user)
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @offer.update_attributes(params[:offer])
      redirect_to user_offers_path(current_user)
    else
      render action: :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to user_offers_path(current_user)
  end

  def publish
    @offer.publish!
    redirect_to offers_path
  end

  def hide
    @offer.hide!
    redirect_to offers_path
  end

  def countries
    render json: Offer.published.map(&:country).uniq!
  end

  def regions
    render json: Offer.published.by_country(params[:country]).map(&:region).uniq!
  end

  def cities
    render json: Offer.published.by_country(params[:country]).by_region(params[:region]).map(&:city).uniq!
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
