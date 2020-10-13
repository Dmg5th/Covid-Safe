class ReviewsController < ApplicationController
  before_action :require_login, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_review, only:[:show, :edit, :update, :destroy]
  

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
      redirect_to reviews_path if !@review
    end 

    def edit
      if @review && @review.user == current_user
        render :edit
      else 
        redirect_to reviews_path 
      end 
    end 

    def update
      if @review && @review.user == current_user
        @review.update(review_params)
        redirect_to review_path(@review)
      else
        redirect_to reviews_path
      end 
    end 

    def destroy
      @review.destroy
      redirect_to reviews_path 
    end 

  private

    def review_params
      params.require(:review).permit(:good_air_ventilation, :staff_practicing_safe_covid_protocols, :seats_far_apart, :outside_seating, :additional_comments, :overall_rating, :establishment_id )
    end 

    def set_review
      @review = Review.find_by(id: params[:id])
    end 

    
end
