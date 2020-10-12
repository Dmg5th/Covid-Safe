class SessionsController < ApplicationController

    def welcome
    end 

    def new
      @user = User.new 
    end 

    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else 
        flash[:error] = "Sorry login info is incorrect, please try again"
        redirect_to '/login'
      end 
    end 

    def destroy
     session.delete :user_id
     redirect_to '/'
    end 

   def omniauth
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end 
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
   end 

  private 

   def auth
    request.env['omniauth.auth']
  end

end


