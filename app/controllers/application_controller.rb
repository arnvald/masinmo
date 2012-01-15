class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application"

  before_filter :search_object
  before_filter :find_announcements

  def search_object
    @search = Offer.search
  end

  def find_announcements
    @announcements = Announcement.for_sidebar
  end
end
