# encoding: utf-8

class MainController < ApplicationController

  def index
    @offers = Offer.last(6)
  end

end
