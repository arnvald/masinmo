class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application"

  before_filter :search_object

  def search_object
    @search = Offer.search
  end
end
