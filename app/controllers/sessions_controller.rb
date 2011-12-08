class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to root_path, :notice => "You have been successfully logged in!"
    else
      flash.now.alert = "Email or password invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "You have been successfully logged out!"
  end
end
