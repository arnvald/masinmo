class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application"

  before_filter :search_object
  before_filter :find_announcements
  before_filter :find_advertisements

  def search_object
    @search = Offer.search
  end

  def find_announcements
    @news = Announcement.for_sidebar
  end

  def find_advertisements
    @contract_top = Contract.active.of_placement(Placement.find_by_name("top_page")).first
    @contract_bottom = Contract.active.of_placement(Placement.find_by_name("bottom_page")).first
  end
end
