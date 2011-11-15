# encoding: utf-8

class MainController < ApplicationController

  def index
    @offers = Offer.last(6)
    @contract_top = Contract.active.of_placement(Placement.find_by_name("top_page")).first
  end

end
