class Establishment < ApplicationRecord
    belongs_to :category
    belongs_to :user #creator of it , maybe take out?
    has_many :reviews
    has_many :users, through: :reviews 
    # accepts_nested_attributes_for :category
    validates :name, presence: true
    validate :not_a_duplicate#try to come up with custom validation for this 
    
   


    def category_attributes=(attributes)
      category = Category.find_or_create_by(attributes) if !attributes[:name].empty?
    end 

    def not_a_duplicate
      if Establishment.find_by(name: name, category_id: category_id)
        errors.add(:establishment, "has already been added to site. Add a review if you haven't already")
      end 
    end 

    def name_and_category
      "#{name} - #{category.name} "
    end 



end
