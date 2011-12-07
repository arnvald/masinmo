module ApplicationHelper

  def my_offers?
    current_user &&
    params[:q] &&
    params[:q][:user_id_eq] == current_user.id.to_s
  end

  def map_view?
    params[:map] == "true"
  end

  def switch_view_link
    if map_view?
      link_to "List view", url_for(map: false, q: params[:q])
    else
      link_to "Map view", url_for(map: true, q: params[:q])
    end
  end

end
