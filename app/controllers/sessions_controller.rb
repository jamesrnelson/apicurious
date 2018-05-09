class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      session[:token] = request.env["omniauth.auth"]['credentials']['token']
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
