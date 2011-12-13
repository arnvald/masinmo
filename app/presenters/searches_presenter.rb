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

  private

  def offers_data(attr)
    Offer.published.map {|o| o.send(attr)}
  end

end
