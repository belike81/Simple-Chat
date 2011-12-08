class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def not_authenticated
    redirect_to login_path, :notice => "Sorry, you have to log in first" 
  end
end
