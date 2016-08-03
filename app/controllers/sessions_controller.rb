class SessionsController < ApplicationController
  def new
    #uhhhh ignore this? Why did I put this in the first place?
  end
  
  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
      flash[:alert]="Please make sure you entered your username and password correctly and try again."
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to '/'
  end
end
