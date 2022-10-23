class Role < ApplicationRecord
    belongs_to :users
    VALID_ROLES= ['extern', 'editor', 'admin']
    validates :roles, inclusion: {in: VALID_ROLES}
end
