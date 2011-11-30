class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application"

  before_filter :search_objects

  def search_objects
    @search = Offer.search
    @countries = clear_results Offer.published.map(&:country)
    @regions = clear_results Offer.published.map(&:region)
    @cities = clear_results Offer.published.map(&:city)
  end

  private
  def clear_results(arr)
    arr.uniq.select {|x| !x.blank?}
  end
end
