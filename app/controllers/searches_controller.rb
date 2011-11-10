class SearchesController < ApplicationController
  def show
    @offers = Offer.published
  end
end
