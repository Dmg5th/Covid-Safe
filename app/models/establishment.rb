class Establishment < ApplicationRecord
    belongs_to :category
    belongs_to :user #creator of it 
    has_many :reviews
    has_many :users, through: :reviews 
end
