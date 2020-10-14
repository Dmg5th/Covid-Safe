class Establishment < ApplicationRecord
    belongs_to :category
    belongs_to :user #creator of it , maybe take out?
    has_many :reviews
    has_many :users, through: :reviews 
    # accepts_nested_attributes_for :category
    has_one_attached :image
    validates :name, presence: true
    validate :not_a_duplicate#try to come up with custom validation for this 
    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(overall_rating) desc')}#scope method that I may or may not keep 
    scope :search, ->(query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%")}

    def self.alpha
      order(:name)
    end 

    def category_attributes=(attributes)
      category = Category.find_or_create_by(attributes) if !attributes[:name].empty?
    end 

    def not_a_duplicate
      if Establishment.find_by(name: name, category_id: category_id)
        errors.add(:establishment, "has already been added to site. Add a review if you haven't already")
      end 
    end 

    def name_and_category
      "#{self.name} - #{self.category.name} "
    end 



end
