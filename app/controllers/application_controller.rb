class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?

private

  def logged_in? 
    !!current_user
  end 

  def require_login
    unless logged_in?
      redirect_to '/login'
    end 
  end 

  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end 


end









