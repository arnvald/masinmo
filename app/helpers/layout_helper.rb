# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def nav_class(name, paras = {})
    paras.each do |k,v|
      return "" unless params[k] == v
    end
    controller.controller_name == name ? "active" : ""
  end

  def home_nav_class
    nav_class("main")
  end

  def offers_nav_class(my = false)
    return "" unless controller.controller_name == "offers"
    return "" unless current_user
    return "" unless (params[:user_id] == current_user.id.to_s) == my
    "active"
  end

  def my_offers_nav_class
    offers_nav_class(true)
  end
end
