class SessionsController < ApplicationController
   def new
   end


  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path
  
    else
      flash[:errors] = ["Invalid Username or Password!"]
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
