class Comment < ApplicationRecord
  include Visible
  belongs_to :user
  belongs_to :article
  has_many :signalement
  validates :title, presence: true
  validates :body, presence: true, length: {minimum:4}
  
  
end