class ReviewsController < ApplicationController

    def index
    end 

    def new
      @establishment = Establishment.find_by(id: params[:establishment_id] )
      @review = @establishment.reviews.build
    end 

    def create
      # byebug
      @review = Review.new(review_params)
      if @review.save
      redirect_to review_path(@review)
      else 
        render :new 
      end 
    end 

    def show
    end 

  private

    def review_params
      params.require(:review).permit(:good_air_ventilation, :staff_practicing_safe_covid_protocols, :seats_far_apart, :outside_seating, :additional_comments, :establishment_id )
    end 


end
