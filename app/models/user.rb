class User < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :password, presence: true
    has_secure_password
    VALID_ROLE= ['extern', 'editor', 'admin']
    validates :role, inclusion: {in: VALID_ROLE}
    def to_session
        {id: id}
    end
    
end