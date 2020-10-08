class User < ApplicationRecord
    has_many :reviews
    has_many :establishments, through: :reviews
end 
