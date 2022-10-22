class Role < ApplicationRecord
    belongs_to :users
    VALID_ROLES= ['extern', 'editor', 'admin']
    validates :roles, presences: true, inclusion: {on: VALID_ROLES}
end
