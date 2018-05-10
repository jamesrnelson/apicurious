class FollowersController < ApplicationController
  def index
    @github_followers = UserLists.new(current_user.screen_name, session[:token], '/followers')
  end
end
