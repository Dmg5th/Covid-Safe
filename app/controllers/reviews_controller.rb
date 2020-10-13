class ReviewsController < ApplicationController
  before_action :require_login, only:[:new, :create]

    def index
      if @establishment = Establishment.find_by(id: params[:establishment_id])
        @reviews = @establishment.reviews #nested
      else 
        @reviews = Review.all #not nested
      end 
    end 

    def new
      if @establishment = Establishment.find_by(id: params[:establishment_id])
         @review = @establishment.reviews.build
      else 
         @review = Review.new 
      end 
    end 

    def create
      @review = Review.new(review_params)
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@review)
      else 
        render :new 
      end 
    end 

    def show
      @review = Review.find_by(id: params[:id])
    end 

  private

    def review_params
      params.require(:review).permit(:good_air_ventilation, :staff_practicing_safe_covid_protocols, :seats_far_apart, :outside_seating, :additional_comments, :overall_rating, :establishment_id )
    end 


end
