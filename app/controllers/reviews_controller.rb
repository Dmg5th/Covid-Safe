class ReviewsController < ApplicationController

    def index
    end 

    def new
      @establishment = Establishment.find_by(id: params[:establishment_id] )
      @review = @establishment.reviews.build
    end 


end
