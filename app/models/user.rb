class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_establishments, through: :reviews, source: :establishment #because of bottom relationship
    has_many :establishments #that have been created by a user 

    validates :username, uniqueness: true, presence: true
    
    has_secure_password
end 
 