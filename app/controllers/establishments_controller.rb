class EstablishmentsController < ApplicationController

    def new
      @establishment = Establishment.new  
    end 

    def create
    end 

    def show
    end 


private 
    def establishment_params
      params.require(:establishment).permit(:name, :location, :category_id)
    end 



end
