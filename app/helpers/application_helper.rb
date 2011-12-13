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

  def prices_ranges
    [ 
      ["0-500", 0],
      ["500-1000", 1],
      ["1000-2000", 2],
      ["2000-5000", 3],
      ["5000-10000", 4],
      ["10000-100000", 5],
      ["100000-1000000", 6]
    ]
  end

  def bathroom_ranges
    [
      ["1", 1],
      ["2", 2],
      ["3 or more", 3]
    ]
  end

end
