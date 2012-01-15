class SearchesPresenter

  require 'delegate'
  attr_reader :search

  def initialize(search, view, user=nil)
    @search = search
    @view = view
    @user = user
  end

  [:country, :region, :city].each do |place|
    define_method "#{place.to_s.pluralize}" do
      offers_data(place).uniq.select {|p| !p.blank?}
    end
  end

  def price_ranges(kind="sell")
    send(:"#{kind}_price_ranges") if Offer::KINDS.include?(kind)
  end

  def rent_price_ranges
    [
      "0-200",
      "200-300",
      "300-400",
      "400-500",
      "500-750",
      "750-1000",
      "1000-1500",
      "1500-2000",
      "2000-"
    ]
  end

  def sell_price_ranges
    [ 
      "0-40000",
      "40000-60000",
      "60000-80000",
      "80000-100000",
      "100000-125000",
      "125000-150000",
      "150000-200000",
      "200000-300000",
      "200000-"
    ]
  end

  def bathroom_ranges
    %w(1 2 3 more\ than\ 3)
  end

  def room_ranges
    %w(1 2 3 4 5 more\ than\ 5)
  end

  private

  def offers_data(attr)
    Offer.published.map {|o| o.send(attr)}
  end

end
