class User < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
       
    VALID_ROLE= ['extern', 'editor', 'admin']
    validates :role, inclusion: {in: VALID_ROLE}
    has_secure_password
    def to_session
        {id: id}
    end
    
end