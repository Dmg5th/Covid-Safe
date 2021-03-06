class EstablishmentsController < ApplicationController
    before_action :require_login, only:[:new, :create]

    def index
      @establishments = Establishment.order_by_rating.includes(:category)#not really sure about the includes here
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
        @establishment.build_category
        render :new 
      end 
    end 

    def show
      @establishment = Establishment.find_by(id: params[:id])
      redirect_to establishments_path if !@establishment
    end 

    def search 
    end 

    def results
      @establishments = Establishment.search(params[:q])
      if @establishments.exists? 
        render :index
      else 
        flash[:error] = "There are no establishments by this name"
        redirect_to establishments_path
      end
    end 


private 
    def establishment_params
      params.require(:establishment).permit(:name, :location, :category_id, :image, category_attributes: [:name])
    end 



end
