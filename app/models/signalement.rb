class Signalement < ApplicationRecord
    validates :user_id, presence: true
    validates :comment_id, presence: true
    belongs_to :comment
    belongs_to :user
end
