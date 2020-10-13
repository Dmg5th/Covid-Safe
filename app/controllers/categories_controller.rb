class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @category = Category.all 
  end 

  def show
    @category = Category.find_by(id: params[:id])
  end 





end
