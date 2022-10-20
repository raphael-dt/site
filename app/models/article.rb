class Article < ApplicationRecord
    include Visible
    has_and_belongs_to_many :tags
    has_many :comment, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

end
