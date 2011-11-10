module ApplicationHelper

  def my_offers?
    current_user &&
    params[:q] &&
    params[:q][:user_id_eq] == current_user.id.to_s
  end

  def map_view?
    params[:map] == "true"
  end

end
