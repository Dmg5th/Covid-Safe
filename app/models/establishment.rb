class Establishment < ApplicationRecord
    belongs_to :category
    belongs_to :user #creator of it , maybe take out?
    has_many :reviews
    has_many :users, through: :reviews 
    # accepts_nested_attributes_for :category
    validates :name, presence: true
    # validate: not_a_duplicate
   


    def category_attributes=(attributes)
      category = Category.find_or_create_by(attributes) if !attributes[:name].empty?
    end 

    def not_a_duplicate
      Establishment.find_by()
    end 



end
