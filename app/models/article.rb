class Article < ApplicationRecord
    include Visible
    has_many :comment, dependent: :destroy
    has_and_belongs_to_many :tags_article
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

end
