class FollowingController < ApplicationController
  def index
    @github_following = GithubFollowing.new(current_user.screen_name, session[:token])
  end
end
