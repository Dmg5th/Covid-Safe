class EstablishmentsController < ApplicationController

    def index
      @establishments = Establishment.all
    end 
    
    def new
      @establishment = Establishment.new  
      @establishment.build_category
    end 

    def create
      @establishment = Establishment.new(establishment_params)
      @establishment.user_id = session[:user_id]
      if @establishment.save && @establishment.name != ""
        redirect_to establishment_path(@establishment)
      else 
        flash[:error] = "New Entry must have a name and an estblishment type."
        render :new 
      end 
    end 

    def show 
    end 


private 
    def establishment_params
      params.require(:establishment).permit(:name, :location, :category_id, category_attributes: [:name])
    end 



end
