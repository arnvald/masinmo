class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application"

  def disable_attr_protection
    resource_class.try(:accessible=, :all) if current_user.admin? && self.kind_of?(ActiveAdmin::ResourceController)
  end
end
