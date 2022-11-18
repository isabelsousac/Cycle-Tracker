class User < ApplicationRecord
    has_many :cycles
    has_many :symptoms, :through => :cycles
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
