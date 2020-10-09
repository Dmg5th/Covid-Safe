class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_establishments, through: :reviews, source: :establishment
    has_many :establishments #that have been created by a user 
end 
 