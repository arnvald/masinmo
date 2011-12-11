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

  private

  def offers_data(attr)
    Offer.published.map {|o| o.send(attr)}
  end
end
