class Comment < ActiveRecord::Base

  belongs_to :offer
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

end
