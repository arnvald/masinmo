# encoding: utf-8

class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_offer

  def new
  end

  def create
    OfferMailer.report(@offer, current_user, params[:report]).deliver
    redirect_to offer_path(@offer)
  end

  private
  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

end
