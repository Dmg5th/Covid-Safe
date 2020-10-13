class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @category = Category.all 
  end 
end
