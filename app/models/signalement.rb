class Signalement < ApplicationRecord
    validates :users, presence: true
    validates :comments, presence: true
    belongs_to :comment
    belongs_to :user
end
