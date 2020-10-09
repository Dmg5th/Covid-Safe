class Establishment < ApplicationRecord
    belongs_to :category
    belongs_to :user #creator of it , maybe take out?
    has_many :reviews
    has_many :users, through: :reviews 
    accepts_nested_attributes_for :category
end
