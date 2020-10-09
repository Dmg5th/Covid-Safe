class ReviewsController < ApplicationController

    def index
    end 

    def new
      @establishment = Establishment.find_by(id: params[:id])
    #   @review = @establishment.build_review
    end 


end
