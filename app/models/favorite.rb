# encoding: utf-8
class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :offer

end
