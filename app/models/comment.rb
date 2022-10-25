class Comment < ApplicationRecord
  include Visible
  belongs_to :user
  belongs_to :article
  has_many :signalements
  validates :commenter, presence: true
  validates :body, presence: true, length: {minimum:4}
  
  
end