class FollowersController < ApplicationController
  def index
    @github_followers = UserLists.new(session[:github_user], session[:token], '/followers')
    @user_info = UserInfo.new(session[:github_user], session[:token])
  end
end
