# encoding: utf-8

class OffersController < ApplicationController

  before_filter :authenticate_user!, except: [:index]
  before_filter :find_offer, except: [:index, :new, :create]
  before_filter :check_owner, except: [:index, :show, :new, :create]

  def index
    all_offers = my_offers? ? current_user.offers : Offer.published
    @search = all_offers.search(params[:q])

    @offers = @search.result
    if params[:map] != "true"
      @offers = @offers.page(params[:page] || 1).order(params[:s] || "created_at desc")
    end
  end

  def show
    @comment = @offer.comments.build
    @comments = @offer.comments.order("created_at desc")
  end

  def new
    #TODO make flexible number of photos
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
    if @offer.publish!
      redirect_to user_offers_path(current_user)
    else
      render action: :edit
    end
  end

  def hide
    @offer.hide!
    redirect_to user_offers_path(current_user)
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

  def my_offers?
    params[:user_id] && current_user && current_user.id == params[:user_id].to_i
  end

end
