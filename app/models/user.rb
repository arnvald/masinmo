# encoding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :offers
  has_many :favorites, dependent: :destroy

  def is_admin?
    true
  end

  def to_s
    email
  end
end
