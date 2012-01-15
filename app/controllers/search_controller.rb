# encoding: utf-8

class SearchController < ApplicationController

  def cities
    @cities = Offer.published.where(params[:region] ? {region: params[:region]} : {country: params[:country]}).map(&:city).compact.uniq
    render json: @cities
  end

  def regions
    @regions = Offer.published.where(country: params[:country]).map(&:region).compact.uniq
    render json: @regions
  end

  def price_ranges
    search = SearchesPresenter.new(Offer.search,nil)
    @ranges = search.price_ranges(params[:kind])
    render json: @ranges
  end

end
