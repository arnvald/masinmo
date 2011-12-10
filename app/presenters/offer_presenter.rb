class OfferPresenter

  require 'delegate'
  attr_reader :offer

  def initialize(offer, view, user=nil)
    @offer = offer
    @user = user
    @view = view
  end

  def delete_favorite_link
    return nil unless @user && favorite
    helper.link_to "delete favorite", @view.favorite_path(favorite), class: "del_favorite #{'hidden' unless already_favorited?}", method: :delete, remote: true
  end

  def add_favorite_link
    return nil unless @user
    helper.link_to "add favorite", @view.favorites_path(offer: @offer.id), class: "add_favorite #{'hidden' if already_favorited?}", method: :post, remote: true
  end

  def change_state_link
    if @offer.draft?
      helper.link_to 'publish', @view.publish_offer_path(@offer), method: :put
    elsif @offer.published?
      helper.link_to 'hide', @view.hide_offer_path(@offer), method: :put
    else
      "Offer expired"
    end
  end

  def method_missing(*args)
    @offer.send(*args)
  end

  def allowed_to_edit?
    return false unless @user
    @user.admin? || offer.owned_by?(@user)
  end

  def present_attr(attr)
    helper.raw("""
    <p>
      <strong>
      #{attr.to_s.capitalize.gsub('_',' ')}:
      </strong>
      #{@offer.send(attr)}
    </p>
    """)
  end


  private
  def already_favorited?
    !!favorite
  end

  def helper
    ActionController::Base.helpers
  end

  def favorite
    Favorite.find_by_user_id_and_offer_id(@user.id, @offer.id)
  end

end
