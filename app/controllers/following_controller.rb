class FollowingController < ApplicationController
  def index
    @github_following = UserLists.new(current_user.screen_name, session[:token], '/following')
  end
end
