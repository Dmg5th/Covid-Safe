class User < ApplicationRecord
    has_many :reviews
    has_many :establishments, through: :reviews
    has_many :establishments #that have been created by a user 
end 
 