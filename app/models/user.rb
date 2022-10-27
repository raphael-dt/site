class User < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    has_one :role, dependent: :destroy
    has_secure_password
    def to_session
        {id: id}
    end
end