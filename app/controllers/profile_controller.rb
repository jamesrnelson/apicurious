class ProfileController < ApplicationController
  def index
    session[:github_user] = params[:github_user]
    @user_info = UserInfo.new(session[:github_user], session[:token])
  end
end
