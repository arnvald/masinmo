# encoding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :username, :first_name, :last_name, :country, :city, :postal_code, :phone,
    :login

  attr_accessor :login

  validates :username, presence: true, uniqueness: true, length: {maximum: 12}
  validates :first_name, presence: true, length: {maximum: 64}
  validates :last_name, presence: true, length: {maximum: 64}
  validates :country, presence: true
  validates :city, presence: true
  validates :email, presence: true

  has_many :offers
  has_many :favorites, dependent: :destroy
  has_many :favorite_offers, source: :offer, through: :favorites
  has_many :comments, dependent: :nullify
  has_many :subscribed_offers, source: :offer, through: :favorites
  has_many :subscriptions, dependent: :destroy

  def is_admin?
    admin == true
  end

  def to_s
    email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value", { :value => login.strip.downcase }]).first
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
