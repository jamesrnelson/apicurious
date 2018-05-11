class FollowingController < ApplicationController
  def index
    @github_following = UserLists.new(session[:github_user], session[:token], '/following')
    @user_info = UserInfo.new(session[:github_user], session[:token])
  end
end
