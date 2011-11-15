module OffersHelper

  def show_map(data)
    gmaps(
      #markers: {data: data.to_gmaps4rails},
      map_options: {
        detect_location: true,
        center_on_user: true,
        zoom: 15,
        auto_zoom: false
    })
  end
end
