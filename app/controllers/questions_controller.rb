# encoding: utf-8

class QuestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_offer

  def new
  end

  def create
    OfferMailer.contact_owner(@offer, current_user, params[:question]).deliver
    redirect_to offer_path(@offer)
  end

  private
  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

end

