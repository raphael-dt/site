class Role < ApplicationRecord
    belongs_to :user
    VALID_ROLES= ['extern', 'editor', 'admin']
    validates :right, inclusion: {in: VALID_ROLES}
end
