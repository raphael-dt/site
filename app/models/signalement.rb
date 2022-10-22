class Signalement < ApplicationRecord
    validates :users, presence: true
    validates :comments, presence: true
    belongs_to :comments
    belongs_to :users
end
