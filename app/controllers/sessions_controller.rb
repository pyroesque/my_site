class SessionsController < ApplicationController
 def new
 end
 
  def create
     user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      flash[:success] = "Login Successful! Welcome #{user.name}"
      redirect_to root_path
    else
      if user
        flash[:error] = "Login failed! Please check your password."
      else
        flash[:error] = "Login failed! The user does not exist."
      end
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    
    redirect_to root_path
  end
end
